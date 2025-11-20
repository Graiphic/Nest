<p align="center">
  <img src="./img/logo%20nest.svg" alt="NEST Logo" width="260"/>
</p>

# NEST – Next Energy Smart Twin

Graiphic presents **NEST**, an advanced architecture enabling buildings to learn, predict, and optimize their energy behaviour — autonomously, locally, and efficiently.

<p align="center">
  <a href="./Doc/NEST_Whitepaper_1.1.pdf">
    <img src="./img/NEST_Whitepaper.PNG" alt="NEST Whitepaper Cover" width="750"/>
  </a>
</p>

<p align="center">
  <b><a href="./Doc/NEST_Whitepaper_1.1.pdf">Read the full NEST Whitepaper (PDF)</a></b>
</p>

---

## Vision

Buildings represent nearly 40% of global energy consumption and a substantial portion of greenhouse gas emissions.  
Traditional Building Management Systems (BMS) remain static, cloud-dependent, and unable to adapt to evolving environmental or occupancy conditions.

**NEST (Next Energy Smart Twin)** introduces a new paradigm.  
It combines Generative AI, Data-Driven Digital Twins, and Reinforcement Learning into a unified, self-learning, and sovereign AI that enables buildings to understand themselves and adapt continuously.

---

## Architecture Overview

NEST operates through three coordinated stages, executed entirely on the edge:

1. **Generative AI Bootstrapping**  
   A large language model (LLM) initiates intelligent HVAC control based on semantic reasoning and real-time data.  
   → Immediate operational intelligence without historical data.

2. **Data-Driven Digital Twin Construction**  
   A predictive model learns the thermal and energy dynamics of the building.  
   → Continuous self-learning without requiring BIM or cloud services.

3. **Reinforcement Learning Optimization**  
   An RL agent trains on the digital twin to discover optimal control policies.  
   → Fully autonomous and progressively improving energy performance.

All computation, data storage, and control remain fully local, ensuring:  
- Compliance with GDPR and ISO 50001  
- Very low latency  
- Broad interoperability (BACnet, Modbus, MQTT)  
- Complete independence from cloud infrastructures  

---

## Disruptive Positioning

<p align="center">
  <img src="./img/Orvillechart_GTB.png" alt="NEST Orville Chart" width="700"/>
</p>

NEST occupies a new category of sovereign, explainable AI dedicated to real-time building energy optimisation.

| Dimension | Classical BMS | Cloud Predictive Control | NEST |
|----------|----------------|--------------------------|------|
| Autonomy | Fixed rules | Limited adaptivity | Self-learning |
| Infrastructure | Cloud-dependent | Cloud-assisted | Fully local |
| Intelligence | Manual tuning | Partial prediction | Full cognitive loop |
| Energy Savings | <10% | 15–20% | 25–35% |
| ROI | >36 months | ~30 months | <12 months |

---

## Edge Infrastructure

NEST runs natively on platforms such as **NVIDIA Jetson Orin**, **Jetson Nano**, and **DGX Spark (2025)**.  
The system is built entirely on **ONNX Runtime (opset 20, IR 10)** to execute inference, learning, and control on site.

Key elements:
- Local time-series database for telemetry  
- Embedded web dashboard for supervision and manual override  
- Standard interfaces (BACnet, Modbus, MQTT, REST)  
- Edge-first execution ensuring privacy, resilience, and predictability  

---

## Impact and Research Context

- Energy savings: 25–35%  
- Return on investment: less than 12 months  
- Comfort deviation: ±0.3 °C  
- Compliance: EU Green Deal, BACS Directive, ISO 50001  
- Foundations: Generative AI + Digital Twin + Reinforcement Learning  

By turning each building into an autonomous energy agent, NEST aligns AI innovation with sustainability and strategic sovereignty.

---

## Why It Matters

NEST transforms buildings into adaptive, intelligent systems capable of self-optimisation.  
By embedding intelligence directly at the hardware layer, the solution eliminates cloud dependency, enhances explainability, and delivers measurable performance gains in real time.

---

## Call for Partners & Funding

Graiphic seeks collaboration with:  
- Equity investors supporting large-scale deployment across Europe and Africa  
- Industrial partners providing pilot sites and validation opportunities  
- HVAC, IoT, and energy companies integrating their products within NEST’s ONNX-based orchestration  

For collaboration inquiries:  
funding@graiphic.io  
https://www.graiphic.io

---

## License

Distributed under the MIT License.  
© 2025 Graiphic — Advancing Sovereign AI for Energy Efficiency.
