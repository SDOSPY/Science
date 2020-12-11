# Science.NET
[![DOI](https://zenodo.org/badge/3964514.svg)](https://zenodo.org/badge/latestdoi/3964514)
[![Build status](https://ci.appveyor.com/api/projects/status/ns9h9opjmu8iw3ep?svg=true)](https://ci.appveyor.com/project/sdospy/framework)
[![Build Status](https://travis-ci.org/science-net/framework.svg?branch=development)](https://travis-ci.org/science-net/framework)
[![NuGet Downloads](https://img.shields.io/nuget/dt/Science.svg)](https://www.nuget.org/packages/Science/)
[![License](https://img.shields.io/badge/license-LGPL--2.1-blue.svg)](LICENSE)
[![NuGet](https://img.shields.io/nuget/v/Science.svg)](https://www.nuget.org/packages/Science/)
[![NuGet Pre Release](https://img.shields.io/nuget/vpre/Science.svg)](https://www.nuget.org/packages/Science/)

Aprendizaje automático, visión computarizada, estadística e informática científica general para .NET

El proyecto Science.NET proporciona métodos de aprendizaje automático, estadísticas, inteligencia artificial, visión artificial y procesamiento de imágenes a .NET. Se puede usar en Microsoft Windows, Xamarin, Unity3D, aplicaciones de la Tienda Windows, Linux o móviles.

Ofrece una API unificada para los modelos de aprendizaje automático de aprendizaje/entrenamiento que es fácil de usar y extensible. Se basa en el siguiente patrón:

- Elija un [algoritmo de aprendizaje](http://science-framework.net/docs/html/N_Science_MachineLearning.htm) que proporcione un método Learn(x, y) o Learn(x);
- [Use Learn(x, y)](http://science-framework.net/docs/html/M_Science_MachineLearning_VectorMachines_Learning_SequentialMinimalOptimization_Learn.htm) para crear un [modelo de aprendizaje automático](http://science-framework.net/docs/html/T_Science_MachineLearning_VectorMachines_SupportVectorMachine.htm) aprendido a partir de los datos;
- Utilice los [métodos Transform](http://science-framework.net/docs/html/M_Science_MachineLearning_ClassifierBase_2_Transform.htm), [Decide](http://science-framework.net/docs/html/M_Science_MachineLearning_ClassifierBase_2_Decide_1.htm), [Scores](http://science-framework.net/docs/html/M_Science_MachineLearning_BinaryScoreClassifierBase_1_Scores_3.htm) , [Probabilities](http://science-framework.net/docs/html/M_Science_MachineLearning_BinaryLikelihoodClassifierBase_1_Probabilities.htm) o [LogLikelihoods](http://science-framework.net/docs/html/M_Science_MachineLearning_VectorMachines_SupportVectorMachine_2_LogLikelihood.htm) del modelo.

Para obtener más información, consulte la [guía de introducción](https://github.com/SDOSPY/Science/wiki/Introduccion) y consulte [la wiki de clasificación](https://github.com/SDOSPY/Science/wiki/Clasificacion).

**Actualización (10/05/2020)**: Consulte la [sección de estado actual](https://github.com/SDOSPY/Science#current-status) a continuación antes de empezar a usar esta biblioteca en cualquier proyecto nuevo.

# Instalación

Para instalar el marco de trabajo en la aplicación, use NuGet. Si está en Visual Studio, haga clic con el botón secundario en el elemento "Referencias" de la carpeta de la solución y seleccione "Administrar paquetes NuGet." Busque Science.MachineLearning ([o equivalentemente, Science.Math, Science.Statistics o Science.Imaging](https://www.nuget.org/packages?q=science.net) dependiendo de su objetivo inicial)y seleccione "Instalar."

Si desea instalar el marco de trabajo en [aplicaciones Unity3D](https://unity3d.com), descargue el archivo comprimido "libsonly" desde la [página de versiones](https://github.com/SDOSPY/Science/releases) del marco de trabajo. Ve a la carpeta Releases/Mono y copia los archivos .dll en la carpeta Plugins de tu proyecto de Unity. Por último, busque y agregue el ensamblado System.ComponentModel.DataAnnotations.dll que debería estar disponible desde el sistema a las carpetas de complementos también.

## Aplicaciones de muestra

El marco de trabajo viene con una amplia gama de aplicaciones de ejemplo para ayudarle a empezar rápidamente. Si ha descargado los orígenes del marco de trabajo o ha clonado el repositorio, abra el archivo de solución *Samples.sln* en la carpeta Samples.

Si desea instalar el marco de trabajo en aplicaciones Unity3D, descargue el archivo comprimido "libsonly" desde la página de versiones del marco de trabajo. Ve a la carpeta Releases/Mono y copia los archivos .dll en la carpeta Plugins de tu proyecto de Unity. Por último, busque y agregue el ensamblado System.ComponentModel.DataAnnotations.dll que debería estar disponible desde el sistema a las carpetas de complementos también.n

# Compilación
#### Con Visual Studio 2017

Descargue e instale las siguientes dependencias:

- [T4 Toolbox para Visual Studio 2017](https://github.com/hagronnestad/T4Toolbox/releases/tag/vs2017-b1)
- [Sandcastle Help File Builder (con extensión VS2017)](https://github.com/EWSoftware/SHFB/releases)
- [NUnit 3 Test Adapter](https://marketplace.visualstudio.com/items?itemName=NUnitDevelopers.NUnit3TestAdapter)
- [Visual C++ Redistributable for Visual Studio 2015](https://www.microsoft.com/en-us/download/details.aspx?id=48145&751be11f-ede8-5a0c-058c-2ee190a24fa6) (tanto x64 como x86)

A continuación, vaya al directorio Sources y abra el archivo de solución *Science.NET.sln*. Nota: la solución incluye proyectos de prueba unitaria de F que se pueden deshabilitar o descargar de la solución en caso de que no tenga compatibilidad con las herramientas de F en la versión de Visual Studio.

#### Con Mono en Linux

```bash
# Install Mono
sudo apt-get install mono-complete monodevelop monodevelop-nunit git autoconf make

# Clonar el repositorio
git clone https://github.com/SDOSPY/science.git

# Entrar en el directorio del proyecto
cd science

# Compile la solución de marco de trabajo con Mono
./autogen.sh
make build
make samples
make test
```

