# Mini Proyecto DBT

Proyecto de ejemplo usando **dbt** y **Snowflake**. Este proyecto sigue buenas prácticas de organización de modelos y tests.

---

## Estructura del proyecto

- **staging/**  
  Modelos que hacen limpieza y transformación mínima de las tablas fuente.  
  Ejemplos: `stg_customers.sql`, `stg_orders.sql`.

- **intermediate/**  
  Modelos que combinan y preparan datos intermedios para los marts.  
  (Por ahora vacío, se puede usar para transformaciones complejas).

- **marts/**  
  Modelos de métricas de negocio listos para análisis.  
  Ejemplo: `orders_summary.sql`.

- **models/**  
  Carpeta de ejemplo generada por dbt (`my_first_dbt_model.sql`, etc.)

- **macros/**  
  Funciones reutilizables en dbt.

- **seeds/**  
  Datos estáticos cargables en Snowflake.

- **snapshots/**  
  Modelos de snapshots para registrar cambios históricos.

- **tests/**  
  Tests personalizados de datos.

---

## Configuración

1. Crear un archivo `profiles.yml` en `~/.dbt/` con tus credenciales de Snowflake:

```yaml
mini_proyecto_dbt:
  outputs:
    dev:
      account: account_snowflake
      user: tu_usuario
      password: TU_PASSWORD
      role: ACCOUNTADMIN
      warehouse: COMPUTE_WH
      database: DEV
      schema: PUBLIC
      threads: 1
      type: snowflake
  target: dev
```

2. Validar conexión:
```
dbt debug
```


### **Comandos básicos**

○ Compilar modelos sin ejecutarlos:
```
dbt compile
```

○ Ejecutar todos los modelos: 
```
dbt run
```

○ Correr tests definidos en schema.yml:
```
dbt tests
```


○ Generar documentación:
```
dbt docs generate
dbt docs serve
```


## **Buenas prácticas**
```
○ Mantener staging/ solo para limpieza mínima.
○ marts/ para métricas y análisis de negocio.
○ Escribir tests en schema.yml para columnas clave.
○ Versionar todo con Git y subirlo a GitHub.
```

**Autor**
Maria Victoria D'Ercole
