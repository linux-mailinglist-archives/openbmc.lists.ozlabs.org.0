Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8AA50EE89
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 04:11:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnQNJ3lgsz2yJQ
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 12:11:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=T56p7236;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=01100c5ac3=nick.hawkins@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=T56p7236; dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KkrDn65wHz2yS3
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 07:25:39 +1000 (AEST)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 23LExwPW027532;
 Thu, 21 Apr 2022 19:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject : date : message-id; s=pps0720;
 bh=QgBoamMiZEICwB0eYmyKiR9XUsMuhTjNYHT2xlss6Sc=;
 b=T56p7236YxcGSJ6qtK+XTwx5TAfqCSsloLnoruXEhL5h1oQT6eOaGuCfpzuAnZwvZmfg
 MjG/MmEJ1V95SPOHRDuLnoHXPrwgz4jieUJjplsYM6xOqt8K++h60+bOe78DZ/t3/Dsy
 JAC6jm0+fQkUdG724yUdEzRBcJdN2dJytgllZIltmRcCzxBp+mU312GxW/lwFwBQ6k93
 j/fodB9PlNpQjQwkr3Na6zWBPfI3mcpBEyK8ddP+pDh490n2Tk/w4t85+1mnb7rrsC2w
 EsGoacuGr5s+25QoaF6YDnJLoJkTjtJBxtsGEavkEoT+DicsEPOi8SR5yOxZNGSQRlQ6 bQ== 
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3fk9h1j42p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Apr 2022 19:18:42 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net
 [16.220.97.129])
 by g9t5008.houston.hpe.com (Postfix) with ESMTP id CA30B64;
 Thu, 21 Apr 2022 19:18:40 +0000 (UTC)
Received: from hpe.com (cigateway-dev.us.rdlabs.hpecorp.net [10.14.73.30])
 by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 4B5864A;
 Thu, 21 Apr 2022 19:18:38 +0000 (UTC)
From: nick.hawkins@hpe.com
To: verdun@hpe.com, nick.hawkins@hpe.com, robh+dt@kernel.org,
 daniel.lezcano@linaro.org, tglx@linutronix.de,
 gregkh@linuxfoundation.org, wim@linux-watchdog.org, linux@roeck-us.net,
 linux@armlinux.org.uk, arnd@arndb.de, olof@lixom.net, joel@jms.id.au,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
Subject: [PATCH v5 00/11] Introduce HPE GXP Architecture
Date: Thu, 21 Apr 2022 14:20:23 -0500
Message-Id: <20220421192023.109903-1-nick.hawkins@hpe.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-ORIG-GUID: 4ZJK1Kxp7--H_yyUgkL8iP4CyE-fbXWb
X-Proofpoint-GUID: 4ZJK1Kxp7--H_yyUgkL8iP4CyE-fbXWb
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-21_04,2022-04-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204210102
X-Mailman-Approved-At: Tue, 26 Apr 2022 12:05:01 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Nick Hawkins <nick.hawkins@hpe.com>

Changes since v4:
 *Fixed version mismatch with patchset across all patches
 *Fixed typos with ochi -> ohci echi -> ehci
 *Adjusted Watchdog Kconfig file
 *Adjusted various commit comments
 *Removed un-necessary include file
 *Updated outdated base revision to newer one to resolve merge
  conflicts as well as pickup vendor binding change for hpe.

Changes since v3:
 *Completely redid the dtsi file to represent architecture
 *Reduced device tree size
 *Rewrote the timer driver to start the watchdog driver due
 to similar register region
 *Made adjustments to timer
 *Made adjustments to watchdog
 *Changed gxp.yaml to hpe,gxp.yaml with changes
 *Updated Maintainers to represent new file names
 *Added hpe bindings to generic-ehci and generic-ohci
 *Fixed clock architecture to be accurate

Changes since v2:
 *Reduced size of changes, put them into patchset format
 *Changed from txt->yaml

Changes since v1:
 *Fixed compiler warnings

The GXP is the HPE BMC SoC that is used in the majority
of HPE Generation 10 servers. Traditionally the asic will
last multiple generations of server before being replaced.

Info about SoC:

 HPE GXP is the name of the HPE Soc. This SoC is used to implement
 many BMC features at HPE. It supports ARMv7 architecture based on
 the Cortex A9 core. It is capable of using an AXI bus to which
 a memory controller is attached. It has multiple SPI interfaces
 to connect boot flash and BIOS flash. It uses a 10/100/1000 MAC
 for network connectivity. It has multiple i2c engines to drive
 connectivity with a host infrastructure. The initial patches
 enable the watchdog and timer enabling the host to be able to
 boot.

Nick Hawkins (11):
  archh: arm: mach-hpe: Introduce the HPE GXP architecture
  arch: arm: configs: multi_v7_defconfig
  drivers: wdt: Introduce HPE GXP SoC Watchdog
  clocksource/drivers: Add HPE GXP timer
  dt-bindings: timer: Add HPE GXP Timer Binding
  dt-bindings: watchdog: Add HPE GXP Watchdog timer binding
  dt-bindings: arm: Add HPE GXP Binding
  dt-bindings: usb: generic-ehci:  Add HPE GXP ehci binding
  dt-bindings: usb: generic-ohci:  Add HPE GXP ohci binding
  arch: arm: boot: dts: Introduce HPE GXP Device tree
  maintainers: Introduce HPE GXP Architecture

 .../devicetree/bindings/arm/hpe,gxp.yaml      |  22 +++
 .../bindings/timer/hpe,gxp-timer.yaml         |  49 +++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../bindings/watchdog/hpe,gxp-wdt.yaml        |  30 +++
 MAINTAINERS                                   |  13 ++
 arch/arm/Kconfig                              |   2 +
 arch/arm/Makefile                             |   1 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts      |  13 ++
 arch/arm/boot/dts/hpe-gxp.dtsi                | 128 ++++++++++++
 arch/arm/configs/multi_v7_defconfig           |   3 +
 arch/arm/mach-hpe/Kconfig                     |  17 ++
 arch/arm/mach-hpe/Makefile                    |   1 +
 arch/arm/mach-hpe/gxp.c                       |  16 ++
 drivers/clocksource/Kconfig                   |   8 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-gxp.c               | 182 ++++++++++++++++++
 drivers/watchdog/Kconfig                      |  11 ++
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/gxp-wdt.c                    | 166 ++++++++++++++++
 21 files changed, 668 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/hpe,gxp.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/hpe,gxp-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/hpe,gxp-wdt.yaml
 create mode 100644 arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
 create mode 100644 arch/arm/boot/dts/hpe-gxp.dtsi
 create mode 100644 arch/arm/mach-hpe/Kconfig
 create mode 100644 arch/arm/mach-hpe/Makefile
 create mode 100644 arch/arm/mach-hpe/gxp.c
 create mode 100644 drivers/clocksource/timer-gxp.c
 create mode 100644 drivers/watchdog/gxp-wdt.c

-- 
2.17.1

