# 🏭 Factory Method - Refatoração de Legado em Delphi

> **"Limpou a Regra de Negócio, mas Sujou o Formulário?"**
> Este projeto demonstra como resolver o **Dilema da Criação** em sistemas legados Delphi, removendo a responsabilidade de instanciar classes concretas de dentro dos formulários (UI).

---

## 📋 Descrição e Objetivo

Em sistemas legados, é comum encontrar formulários que conhecem todas as classes do sistema. O objetivo deste projeto é aplicar o padrão **Factory Method** para desacoplar a criação de objetos.

**O Problema (Antes):**
O Form possui `if/else` ou `case` gigantes para decidir qual classe instanciar (ex: Sedex, PAC, Grátis). Se uma nova regra surge, você precisa recompilar a tela.

**A Solução (Depois):**
O Form delega a criação para uma **Factory**. O Form passa a conhecer apenas a **Interface** (`ICalculoFrete`) e a **Factory**, ignorando completamente a existência das classes concretas (`TFreteSedex`, `TFretePAC`).

### Benefícios
*   ✅ **Desacoplamento:** A UI não depende das classes de negócio concretas.
*   ✅ **Manutenibilidade:** Adicionar um novo tipo de frete não quebra o formulário.
*   ✅ **Testabilidade:** A lógica de criação fica centralizada e fácil de testar isoladamente.

---

## 🛠️ Instalação e Requisitos

### Pré-requisitos
*   **IDE:** Delphi (Testado no Delphi 12 community edition, compatível com versões anteriores).
*   **Framework de Testes:** DUnitX (incluso nas versões modernas do Delphi).
*   **Dependências:** Nenhuma dependência externa.

### Instalação
1.  Clone este repositório:
