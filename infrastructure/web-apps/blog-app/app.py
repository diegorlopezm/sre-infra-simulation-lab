from flask import Flask, render_template, request, redirect, url_for, flash
import psycopg2
import redis
import os
from datetime import datetime
import socket  # 🆕 IMPORTANTE: Agregar esto

app = Flask(__name__)
app.secret_key = 'your-secret-key-here'

# Configuración de la base de datos
def get_db_connection():
    conn = psycopg2.connect(os.getenv('DATABASE_URL'))
    return conn

def get_redis_connection():
    return redis.Redis.from_url(os.getenv('REDIS_URL'))

@app.route('/')
def index():
    redis_conn = get_redis_connection()
    visit_count = redis_conn.incr('visit_count')
    
     # 🆕 USAR VARIABLES DE ENTORNO EN VEZ DE HOSTNAME
    instance_name = os.getenv('INSTANCE_NAME', 'ORIGINAL')
    instance_color = os.getenv('INSTANCE_COLOR', 'lightyellow')
    hostname = socket.gethostname()  # Mantener para mostrar
    
    # 🆕 Contador por instancia
    instance_count = redis_conn.incr(f'instance_{instance_name}_count')
    # 🆕 Contador por instancia
    instance_count = redis_conn.incr(f'instance_{instance_name}_count')
    
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM contacts ORDER BY created_at DESC LIMIT 10")
    contacts = cur.fetchall()
    cur.close()
    conn.close()
    
    return render_template('index.html', 
                         visit_count=visit_count, 
                         contacts=contacts,
                         success=request.args.get('success'),
                         # 🆕 NUEVAS VARIABLES
                         instance_name=instance_name,
                         instance_color=instance_color,
                         hostname=hostname,
                         instance_count=instance_count)

@app.route('/add_contact', methods=['POST'])
def add_contact():
    name = request.form['name']
    email = request.form['email']
    message = request.form['message']
    
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute(
            "INSERT INTO contacts (name, email, message) VALUES (%s, %s, %s)",
            (name, email, message)
        )
        conn.commit()
        cur.close()
        conn.close()
        
        # Incrementar contador en Redis
        redis_conn = get_redis_connection()
        redis_conn.incr('contact_count')
        
        return redirect(url_for('index', success='true'))
    except Exception as e:
        return f"Error: {str(e)}", 500

@app.route('/stats')
def stats():
    redis_conn = get_redis_connection()
    visit_count = redis_conn.get('visit_count') or 0
    contact_count = redis_conn.get('contact_count') or 0
    
    return {
        'visits': int(visit_count),
        'contacts': int(contact_count),
        'status': 'healthy'
    }

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)