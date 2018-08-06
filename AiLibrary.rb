class Ailibrary < Formula
  desc "C++ Library from Ailurus Studio"
  homepage "https://github.com/starobinskii/AiLibrary"
  url "https://github.com/starobinskii/AiLibrary/archive/v1.1.0.tar.gz"
  sha256 "037b0306eabceca7566959064aa1cda96df6078ae8dae191bbefbf6932f8fb9e"
  
  head "https://github.com/starobinskii/AiLibrary.git", :branch => "master"

  def install
    include.install "ai.hh"
    ohai "to use the library, please set your include path accordingly:"
    ohai "CPPFLAGS: -I#{include}"
  end

  test do
    (testpath/"test.cc").write <<~EOS
      #include <ai.hh>
      int main(){
        ai::printLine(ai::string("This is AiLibrary v")
          + ai::getVersion()+ ai::string(", welcome!")
        );
        return 0;
      }
    EOS
    system ENV.cxx, "test.cc", "-I#{include}", "-std=c++11", "-o", "test"
    system "./test"
  end
end
