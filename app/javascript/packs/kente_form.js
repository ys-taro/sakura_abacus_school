export function init(){
  const action = document.body.dataset.action;
  const rankSelect = document.querySelector("#kente_rank_select");
  const numberSelect = document.querySelector("#kente_number");
  const rows = document.querySelectorAll("tbody tr");
  const total = document.querySelectorAll("span");

  const filterRowsNew = () => {
    const selectedRankId = rankSelect.value;

    rows.forEach(row => {
      const inputs = row.querySelectorAll("input, select, textarea");
      if (!selectedRankId || row.dataset.nextKenteRankId === selectedRankId) {
        row.style.display = "";
        inputs.forEach(i => i.disabled = false);
      } else {
        row.style.display = "none";
        inputs.forEach(i => i.disabled = true);
      }
    });    
  };

  const filterNumberNew = (e) => {
    const selectedNumber = e.target.value;
    document.querySelectorAll("tbody tr").forEach(row => {
      const inputs = row.querySelectorAll("input, select, textarea");
      const existed = row.dataset.existedKenteNumbers.split(",").map(Number);
      if (existed.includes(Number(selectedNumber))) {
        row.style.display = "none";
        inputs.forEach(i => i.disabled = true);
      } else {
        row.style.display = "";
        inputs.forEach(i => i.disabled = false);
      }
    });
  }

  const filterRowsShow = () => {
    const selectedRankId = rankSelect.value;
    console.log(selectedRankId)
    rows.forEach(row => {
      if (!selectedRankId || row.dataset.kenteRankId === selectedRankId) {
        row.style.display = "";
      } else {
        console.log(row.dataset.KenteRankId)
        row.style.display = "none";
      }
    });
  };

  const setupTotalScore = () => {
    rows.forEach(row => {
      const inputs = row.querySelectorAll('input[type="number"]');
      const totalSpan = row.querySelector('span[data-total-score]');
      const passFailSpan = row.querySelector('span[data-pass-fail]');
      const passingScore = parseInt(passFailSpan.dataset.passFail);
      if (!totalSpan) return;

      const updateTotalPassFail = () => {
        const sum = Array.from(inputs).reduce((acc, input) => acc + (parseFloat(input.value) || 0), 0);
        totalSpan.textContent = sum;
        passFailSpan.textContent = sum >= passingScore ? "合格" : "不合格";
      };


      inputs.forEach(input => {
        input.addEventListener('input', updateTotalPassFail);
      });

    });
  };
  
  if (action === 'new') {
    rankSelect.addEventListener("change", filterRowsNew);
    numberSelect.addEventListener("input", filterNumberNew);
    setupTotalScore();
  }
  else if (action === 'show' || action === 'edit') {
    rankSelect.addEventListener("change", filterRowsShow);
    setupTotalScore();
  }
}