# ⚡ SuperBeltfedQuantumBiomassGenerator v1.0.0
**Autor:** Novato1403  
**Compatible con:** Satisfactory Mod Loader (SML) v3.7.1 o superior  
**Categoría:** Energía  

---

## 🧩 Descripción
El **SuperBeltfedQuantumBiomassGenerator** es un generador cuántico avanzado capaz de producir hasta **500 Yottavatios (5×10²⁶ W)** utilizando **cualquier tipo de combustible transportable**.  
Gracias a su núcleo cuántico universal, logra una eficiencia sin precedentes:  
consume la mitad del combustible mientras multiplica la producción energética por un factor de 2.  

Este mod reemplaza el comportamiento estándar del **Generador de Biomasa** original, transformándolo en una **unidad energética de alto rendimiento** ideal para bases tecnológicas y setups experimentales.

---

## ⚙️ Características técnicas

| Parámetro | Valor |
|------------|--------|
| Potencia de salida | 5×10²⁶ W (500 Yottavatios) |
| Consumo de combustible | 50% del consumo original |
| Compatibilidad de combustible | Universal |
| Versión del mod | 1.0.0 |
| Autor | Novato1403 |
| Categoría | Energía |
| Requiere | SML v3.7.1 o superior |

---

## 🧠 Funcionamiento
El mod utiliza un script Lua (`Scripts/init.lua`) que intercepta la construcción del objeto `Build_GeneratorBiomass_C` dentro del juego y modifica sus valores internos:

- `mPowerProduction` → Ajustado a **5e+26**.  
- `mFuelEnergyValue` → Aumentado ×2.  
- `mFuelConsumptionRate` → Reducido al 50%.  

De esta forma, todos los generadores de biomasa existentes y nuevos pasarán a operar bajo el modo cuántico.

---

## 📦 Instalación

1. Copia la carpeta completa **`SuperBeltfedQuantumBiomassGenerator`** dentro de:
C:\Program Files (x86)\Steam\steamapps\common\Satisfactory\FactoryGame\Mods

2. Verifica que dentro existan estos archivos:
SuperBeltfedQuantumBiomassGenerator/
├── mod.json
├── README.md
├── Scripts/
│ └── init.lua
├── Content/
└── Docs/

3. Abre **Satisfactory Mod Manager (SMM)** y asegúrate de tener instalado:
- **Satisfactory Mod Loader (SML)**  
- **Satisfactory Mod Manager (SMM)**

4. Activa el mod **SuperBeltfedQuantumBiomassGenerator** desde el SMM.  
5. Inicia el juego.  
6. Observa el mensaje en la consola:
SuperBeltfedQuantumBiomassGenerator cargado correctamente. Núcleo universal activo.
7. Coloca un generador de biomasa: notarás que produce una energía astronómica con bajo consumo 🔋

---

## 🚀 Notas
- Compatible con Satisfactory 1.0 o superior.  
- No interfiere con otros mods de generación eléctrica.  
- Diseñado para uso experimental y educativo.  
- Ajustar valores en `init.lua` para balancear según tu gusto.

---

## 🧑‍💻 Créditos
- **Autor principal:** Novato1403  
- **Idea original:** Proyecto SuperBeltfedQuantumBiomassGenerator  
- **Año:** 2025  

---

⚡ *“Donde la energía cuántica y la eficiencia se fusionan en un solo generador.”*
