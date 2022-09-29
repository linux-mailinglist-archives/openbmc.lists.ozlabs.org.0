Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929165EF2DA
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 11:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdTLK237Rz3c34
	for <lists+openbmc@lfdr.de>; Thu, 29 Sep 2022 19:57:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jIJ4UPSP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=jIJ4UPSP;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdTKr0fLjz3c4x
	for <openbmc@lists.ozlabs.org>; Thu, 29 Sep 2022 19:57:04 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 17775B823A5;
	Thu, 29 Sep 2022 09:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B52C433C1;
	Thu, 29 Sep 2022 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1664445419;
	bh=9RU7iPMGT9nbdWdo2TuVo6cBje8m9qLU6ca7x99RqKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIJ4UPSPwR3QnNrqpoAAEsO9ZPY2PSaCphOWWQ8NqH3vpMebGwSWd/LjUX0Ybopiy
	 Q469fZ/f3dDXQUronJ6BDRPvbO715HAQ4afJqcmhV4cwAl/om7k3aQDznNEk4b48h1
	 jBTR/xRZ1iF76K6weteA6UVOSvkB3m6ku5WSdU2E=
Date: Thu, 29 Sep 2022 11:56:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v9 4/9] docs: misc-devices: (smpro-errmon) Add
 documentation
Message-ID: <YzVr6e38fxYylfMA@kroah.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-5-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929094321.770125-5-quan@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Dragan Cvetic <dragan.cvetic@xilinx.com>, Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 29, 2022 at 04:43:16PM +0700, Quan Nguyen wrote:
> Adds documentation for Ampere(R)'s Altra(R) SMpro errmon driver.
> 
> Signed-off-by: Thu Nguyen <thu@os.amperecomputing.com>
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Changes in v9:
>   + Fix issue when building htmldocs                      [Bagas]
>   + Remove unnecessary channel info for VRD and DIMM event [Quan]
>   + Update SPDX license info                               [Greg]
>   + Update document to align with new changes in sysfs     [Quan]
> 
> Changes in v8:
>   + Update to reflect single value per sysfs  [Quan]
> 
> Changes in v7:
>   + None
> 
> Changes in v6:
>   + First introduced in v6 [Quan]
> 
>  Documentation/misc-devices/index.rst        |   1 +
>  Documentation/misc-devices/smpro-errmon.rst | 193 ++++++++++++++++++++
>  2 files changed, 194 insertions(+)
>  create mode 100644 Documentation/misc-devices/smpro-errmon.rst
> 
> diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
> index 756be15a49a4..b74b3b34a235 100644
> --- a/Documentation/misc-devices/index.rst
> +++ b/Documentation/misc-devices/index.rst
> @@ -27,6 +27,7 @@ fit into other categories.
>     max6875
>     oxsemi-tornado
>     pci-endpoint-test
> +   smpro-errmon
>     spear-pcie-gadget
>     uacce
>     xilinx_sdfec
> diff --git a/Documentation/misc-devices/smpro-errmon.rst b/Documentation/misc-devices/smpro-errmon.rst
> new file mode 100644
> index 000000000000..b17f30a6cafd
> --- /dev/null
> +++ b/Documentation/misc-devices/smpro-errmon.rst
> @@ -0,0 +1,193 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver Ampere(R)'s Altra(R) SMpro errmon
> +===============================================
> +
> +Supported chips:
> +
> +  * Ampere(R) Altra(R)
> +
> +    Prefix: 'smpro'
> +
> +    Preference: Altra SoC BMC Interface Specification
> +
> +Author: Thu Nguyen <thu@os.amperecomputing.com>
> +
> +Description
> +-----------
> +
> +This driver supports hardware monitoring for Ampere(R) Altra(R) SoC's based on the
> +SMpro co-processor (SMpro).
> +The following SoC alert/event types are supported by the errmon driver:
> +
> +* Core CE/UE error
> +* Memory CE/UE error
> +* PCIe CE/UE error
> +* Other CE/UE error
> +* Internal SMpro/PMpro error
> +* VRD hot
> +* VRD warn/fault
> +* DIMM Hot
> +
> +The SMpro interface provides the registers to query the status of the SoC alerts/events
> +and their data and export to userspace by this driver.
> +
> +The SoC alerts/events will be referenced as error below.
> +
> +Usage Notes
> +-----------
> +
> +SMpro errmon driver creates the sysfs files for each error type.
> +Example: ``error_core_ce`` to get Core CE error type.
> +
> +* If the error is absented, the sysfs file returns empty.
> +* If the errors are presented, one each read to the sysfs, the oldest error will be returned and clear, the next read will be returned with the next error until all the errors are read out.
> +
> +For each host error type, SMpro keeps a latest max number of errors. All the oldest errors that were not read out will be dropped. In that case, the read to the corresponding overflow sysfs will return 1, otherwise, return 0.
> +Example: ``overflow_core_ce`` to report the overflow status of Core CE error type.
> +
> +The format of the error is depended on the error type.
> +
> +1) For Core/Memory/PCIe/Other CE/UE error types::
> +
> +The return 48-byte in hex format in table below:
> +
> +    =======   =============   ===========   ==========================================
> +    OFFSET    FIELD           SIZE (BYTE)   DESCRIPTION
> +    =======   =============   ===========   ==========================================
> +    00        Error Type      1             See Table below for details
> +    01        Subtype         1             See Table below for details
> +    02        Instance        2             See Table below for details
> +    04        Error status    4             See ARM RAS specification for details
> +    08        Error Address   8             See ARM RAS specification for details
> +    16        Error Misc 0    8             See ARM RAS specification for details
> +    24        Error Misc 1    8             See ARM RAS specification for details
> +    32        Error Misc 2    8             See ARM RAS specification for details
> +    40        Error Misc 3    8             See ARM RAS specification for details
> +    =======   =============   ===========   ==========================================
> +
> +Below table defines the value of Error types, Sub Types, Sub component and instance:
> +
> +    ============    ==========    =========   ===============  ====================================
> +    Error Group     Error Type    Sub type    Sub component    Instance
> +    ============    ==========    =========   ===============  ====================================
> +    CPM (core)      0             0           Snoop-Logic      CPM #
> +    CPM (core)      0             2           Armv8 Core 1     CPM #
> +    MCU (mem)       1             1           ERR1             MCU # | SLOT << 11
> +    MCU (mem)       1             2           ERR2             MCU # | SLOT << 11
> +    MCU (mem)       1             3           ERR3             MCU #
> +    MCU (mem)       1             4           ERR4             MCU #
> +    MCU (mem)       1             5           ERR5             MCU #
> +    MCU (mem)       1             6           ERR6             MCU #
> +    MCU (mem)       1             7           Link Error       MCU #
> +    Mesh (other)    2             0           Cross Point      X | (Y << 5) | NS <<11
> +    Mesh (other)    2             1           Home Node(IO)    X | (Y << 5) | NS <<11
> +    Mesh (other)    2             2           Home Node(Mem)   X | (Y << 5) | NS <<11 | device<<12
> +    Mesh (other)    2             4           CCIX Node        X | (Y << 5) | NS <<11
> +    2P Link (other) 3             0           N/A              Altra 2P Link #
> +    GIC (other)     5             0           ERR0             0
> +    GIC (other)     5             1           ERR1             0
> +    GIC (other)     5             2           ERR2             0
> +    GIC (other)     5             3           ERR3             0
> +    GIC (other)     5             4           ERR4             0
> +    GIC (other)     5             5           ERR5             0
> +    GIC (other)     5             6           ERR6             0
> +    GIC (other)     5             7           ERR7             0
> +    GIC (other)     5             8           ERR8             0
> +    GIC (other)     5             9           ERR9             0
> +    GIC (other)     5             10          ERR10            0
> +    GIC (other)     5             11          ERR11            0
> +    GIC (other)     5             12          ERR12            0
> +    GIC (other)     5             13-21       ERR13            RC# + 1
> +    SMMU (other)    6             TCU         100              RC #
> +    SMMU (other)    6             TBU0        0                RC #
> +    SMMU (other)    6             TBU1        1                RC #
> +    SMMU (other)    6             TBU2        2                RC #
> +    SMMU (other)    6             TBU3        3                RC #
> +    SMMU (other)    6             TBU4        4                RC #
> +    SMMU (other)    6             TBU5        5                RC #
> +    SMMU (other)    6             TBU6        6                RC #
> +    SMMU (other)    6             TBU7        7                RC #
> +    SMMU (other)    6             TBU8        8                RC #
> +    SMMU (other)    6             TBU9        9                RC #
> +    PCIe AER (pcie) 7             Root        0                RC #
> +    PCIe AER (pcie) 7             Device      1                RC #
> +    PCIe RC (pcie)  8             RCA HB      0                RC #
> +    PCIe RC (pcie)  8             RCB HB      1                RC #
> +    PCIe RC (pcie)  8             RASDP       8                RC #
> +    OCM (other)     9             ERR0        0                0
> +    OCM (other)     9             ERR1        1                0
> +    OCM (other)     9             ERR2        2                0
> +    SMpro (other)   10            ERR0        0                0
> +    SMpro (other)   10            ERR1        1                0
> +    SMpro (other)   10            MPA_ERR     2                0
> +    PMpro (other)   11            ERR0        0                0
> +    PMpro (other)   11            ERR1        1                0
> +    PMpro (other)   11            MPA_ERR     2                0
> +    ============    ==========    =========   ===============  ====================================
> +
> +    For example:
> +    # cat error_other_ue
> +    880807001e004010401040101500000001004010401040100c0000000000000000000000000000000000000000000000
> +
> +2) For the Internal SMpro/PMpro error types::
> +
> +The error_[smpro|pmro] sysfs returns string of 8-byte hex value:
> +    <4-byte hex value of Error info><4-byte hex value of Error extensive data>
> +
> +The warn_[smpro|pmro] sysfs returns string of 4-byte hex value:
> +    <4-byte hex value of Warning info>
> +
> +Reference to Altra SoC BMC Interface Specification for the details.
> +
> +3) For the VRD hot, VRD /warn/fault, DIMM Hot event::
> +
> +The return string is 2-byte hex string value. Reference to section 5.7 GPI status register in Altra SoC BMC Interface Specification for the details.
> +
> +    Example:
> +    #cat event_vrd_hot
> +    0000
> +
> +Sysfs entries
> +-------------
> +
> +The following sysfs files are supported:
> +
> +* Ampere(R) Altra(R):
> +
> +Alert Types:
> +
> +    ========================  =================  ==================================================
> +    Alert Type                Sysfs name         Description
> +    ========================  =================  ==================================================
> +    Core CE Error             error_core_ce      Trigger when Core has CE error
> +    Core CE Error overflow    overflow_core_ce   Trigger when Core CE error overflow
> +    Core UE Error             error_core_ue      Trigger when Core has UE error
> +    Core UE Error overflow    overflow_core_ue   Trigger when Core UE error overflow
> +    Memory CE Error           error_mem_ce       Trigger when Memory has CE error
> +    Memory CE Error overflow  overflow_mem_ce    Trigger when Memory CE error overflow
> +    Memory UE Error           error_mem_ue       Trigger when Memory has UE error
> +    Memory UE Error overflow  overflow_mem_ue    Trigger when Memory UE error overflow
> +    PCIe CE Error             error_pcie_ce      Trigger when any PCIe controller has CE error
> +    PCIe CE Error overflow    overflow_pcie_ce   Trigger when any PCIe controller CE error overflow
> +    PCIe UE Error             error_pcie_ue      Trigger when any PCIe controller has UE error
> +    PCIe UE Error overflow    overflow_pcie_ue   Trigger when any PCIe controller UE error overflow
> +    Other CE Error            error_other_ce     Trigger when any Others CE error
> +    Other CE Error overflow   overflow_other_ce  Trigger when any Others CE error overflow
> +    Other UE Error            error_other_ue     Trigger when any Others UE error
> +    Other UE Error overflow   overflow_other_ue  Trigger when Others UE error overflow
> +    SMpro Error               error_smpro        Trigger when system have SMpro error
> +    SMpro Warning             warn_smpro         Trigger when system have SMpro warning
> +    PMpro Error               error_pmpro        Trigger when system have PMpro error
> +    PMpro Warning             warn_pmpro         Trigger when system have PMpro warning
> +    ========================  =================  ==================================================
> +
> +Event Type:
> +
> +    ============================ ==========================
> +    Event Type                   Sysfs name
> +    ============================ ==========================
> +    VRD HOT                      event_vrd_hot
> +    VR Warn/Fault                event_vrd_warn_fault
> +    DIMM Hot                     event_dimm_hot
> +    ============================ ==========================
> -- 
> 2.35.1
> 

Why not just put this in the driver itself to be generated automatically
instead of living in a file that will never be noticed if anything ever
changes?

thanks,

greg k-h
