/*
 * Copyright 2019 ETH Zurich, University of Bologna
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "report.h"
#include "hero-target.h"

unsigned test_addr_trunc();
unsigned test_va_list(void);
unsigned test_memset(void);

int main(int argc, char *argv[])
{
  unsigned n_errors = 0;
  if (hero_rt_core_id() != 0) {
    return 0;
  }

  n_errors += report_n_errors(test_addr_trunc, "64-bit addr trunc");
  n_errors += report_n_errors(test_va_list, "Variable argument functions");
  n_errors += report_n_errors(test_memset, "Memset");

  assert(n_errors == 0);
  return n_errors;
}
