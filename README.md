# 🏛️ Delphi Design Patterns & Clean Code

![Delphi Version](https://img.shields.io/badge/Delphi-12%20Athens-red)
![License](https://img.shields.io/badge/license-MIT-blue)
![Status](https://img.shields.io/badge/status-active-green)

> Um repositório de estudos práticos aplicando **Design Patterns** (GoF) e princípios de **Clean Code** em Delphi, com foco em resolver problemas reais de sistemas legados.

---

## 🎯 Objetivo
O objetivo deste repositório é demonstrar como sair do "código espaguete" (comum em sistemas legados) e migrar para uma arquitetura orientada a objetos, testável e desacoplada.

Cada pasta dentro de `src` representa um padrão de projeto aplicado a um cenário do mundo real.

---

## 📚 Padrões Implementados

| Categoria | Padrão | Descrição | Status |
| :--- | :--- | :--- | :--- |
| **Behavioral** | [Strategy](./src/behavioral/strategy) | Cálculo de Fretes (Sedex/PAC) sem IFs | ✅ Pronto |
| **Creational** | Factory Method | (Em breve...) | 🚧 |

---

## 🛠️ Tecnologias e Compatibilidade

O projeto foi desenvolvido utilizando **Delphi 12 (Athens)**, mas o código-fonte (`.pas`) é compatível com versões anteriores.

*   **Linguagem:** Object Pascal (Delphi).
*   **Compatibilidade:** Testado no Delphi 12, mas compatível com Delphi Berlin, Tokyo, Rio, Sydney, Alexandria e anteriores (que suportem Generics/Interfaces).
*   **Testes:** DUnitX (Recomendado para versões XE ou superiores).

> **Dica para versões antigas:** Se você usa uma versão muito antiga (ex: Delphi 7), basta criar um novo projeto e adicionar as units manualmente. A lógica do padrão Strategy funciona perfeitamente.

---

## 🚀 Como Executar

1. Clone o repositório:
