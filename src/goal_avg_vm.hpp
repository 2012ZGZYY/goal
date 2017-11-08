#ifndef goal_avg_vm_hpp
#define goal_avg_vm_hpp

#include <Teuchos_ParameterList.hpp>
#include "goal_qoi.hpp"

namespace goal {

using Teuchos::RCP;
using Teuchos::ParameterList;

class Integrator;
template <typename T> class Model;

template <typename T>
class AvgVM : public QoI<T> {
  public:
    AvgVM(ParameterList const& p, RCP<Integrator> model);
    void set_elem_set(int es_idx);
    void at_point(apf::Vector3 const&, double w, double dv);
  private:
    void do_avg(double w, double dv);
    void do_null(double w, double dv);
    std::function<void(AvgVM<T>*, double, double)> op;
    ParameterList params;
    RCP<Model<T>> model;
    int num_dims;
    int es_idx;
};

}

#endif