# AMICAS-Patient-Simulator-AMICASim-v01.2026-
Overview

The AMICAS Simulator is a flexible MATLAB-based simulation environment for evaluating modelling, monitoring, identification, and control strategies during general anesthesia.

The simulator reproduces clinically relevant anesthesia conditions, including nociceptive stimulation represented by surgical disturbance profiles. It provides two virtual patient populations—young and elderly—to support the investigation of intra- and inter-patient variability. A clinically derived patient parameter profile and surgical stimulus profile obtained from the VitalDB database are also included for evaluation under realistic conditions.

Users can configure the patient population, simulation duration, drug inputs, response-surface model, disturbance profile, patient selection, and anesthesiologist-in-the-loop option through the main program.

Key Features

The updated simulator includes:

Three response-surface models describing the interaction between propofol and remifentanil.
Two literature-derived surgical disturbance profiles.
A VitalDB-derived patient parameter profile and surgical stimulus profile.
Young and elderly virtual patient populations.
Representation of both intra- and inter-patient variability.
The influence of cardiac output (CO) on the bispectral index (BIS).
The nociception level (NOL) index as a nociception-related output.
Physiologically and clinically relevant limits for simulator inputs and outputs.
An optional anesthesiologist-in-the-loop configuration.
Model-adaptation and disturbance-estimation algorithms.
Selection of individual patients or patient groups for customized simulations.
Getting Started

Download Simulator_AMICAS.rar from this repository and extract the files to a directory of your choice.

The main simulation file is:

amicas_main_program.m

This file serves as the central configuration and execution point of the simulator.

How to Use the Simulator
Step 1: Select the Patient Database

In amicas_main_program.m, select the patient database or population to be used. The simulator includes young and elderly virtual patient populations, as well as a clinically derived VitalDB patient profile.

Step 2: Define the Simulation Time

Specify the simulation duration by setting the corresponding variable in the main program.

Step 3: Configure the Inputs

Select and configure the desired simulator inputs, including the relevant drug-infusion and physiological inputs.

Step 4: Select the Response-Surface Model

Choose one of the three available response-surface models describing the combined effects of propofol and remifentanil.

Step 5: Select the Surgical Disturbance Profile

Choose a literature-derived or VitalDB-derived surgical disturbance profile to reproduce nociceptive stimulation during surgery.

Step 6: Configure the Anesthesiologist-in-the-Loop Option

Enable or disable the anesthesiologist model depending on the intended simulation scenario.

Step 7: Select the Patient or Patient Group

Select an individual patient or a group of patients to investigate patient-specific responses or population-level variability.

Step 8: Configure Adaptation and Disturbance Estimation

Enable the available model-adaptation and disturbance-estimation algorithms when required by the simulation study.

Step 9: Run the Simulation

Run MAIN_PROGRAM_AMICAS.m after completing the desired configuration.

Simulator Inputs and Outputs

The simulator supports the analysis of drug administration, surgical stimulation, cardiovascular dynamics, and anesthesia-related clinical indices.

The main outputs include:

Bispectral index (BIS).
Nociception level (NOL) index.
Cardiac output (CO).
Mean arterial pressure (MAP).

Physiologically and clinically relevant constraints are applied to the simulator inputs and outputs.

Requirements
MATLAB R2024b (version 9.12) or a later compatible version.
Alternatively, software capable of executing MATLAB .m files may be used, although full compatibility is not guaranteed.
Availability

The simulator files are also publicly available on Zenodo:

https://zenodo.org/records/22007987

DOI: 10.5281/zenodo.22007987
