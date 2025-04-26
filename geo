pip install ase
# geometry_optimization.py

from ase import Atoms
from ase.calculators.emt import EMT
from ase.optimize import BFGS
from ase.visualize import view

# Step 1: Define the molecule (or material system)
molecule = Atoms('H2O',
                 positions=[[0.0, 0.0, 0.0],
                            [0.76, 0.58, 0.0],
                            [-0.76, 0.58, 0.0]])

# Step 2: Attach a calculator (energy and forces)
molecule.calc = EMT()

# Step 3: Set up the optimizer
optimizer = BFGS(molecule)

# Step 4: Run the optimization
optimizer.run(fmax=0.02)  # Convergence criterion: maximum force < 0.02 eV/Å

# Step 5: Output results
print("Optimized positions:")
print(molecule.get_positions())

# (Optional) Visualize the optimized molecule
view(molecule)
