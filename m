Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFE34E2226
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 09:25:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMSNF0tbDz3bNr
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:25:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0gQ+ZQZA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=0gQ+ZQZA; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMSLf5KSZz30M3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 19:23:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 071C5B81144;
 Mon, 21 Mar 2022 08:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6E1C340E8;
 Mon, 21 Mar 2022 08:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1647851013;
 bh=Cfz3f9Iw/dbsqO3pWGoIxGQSFuUQvmLff9oW734nUSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0gQ+ZQZAjVysYCaO3ADO4mYtthm6nqM3Ax2qySTJZFtuEfSV1u9OEwujRcu3Z4y29
 kr+Z6Qv1DqRoitFm1r53pVDwJkEttnjviddGI2xMBZIaqLilNVZX7iodrwz4WipY/i
 ivoxO80ikjHRFW4MVTfm8JV/Dx+2rzb1RI2iOQIA=
Date: Mon, 21 Mar 2022 09:23:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v7 9/9] docs: ABI: testing: Document the Ampere Altra
 Family's SMpro sysfs interfaces
Message-ID: <Yjg2AkYOCTi2CXc1@kroah.com>
References: <20220321081355.6802-1-quan@os.amperecomputing.com>
 <20220321081355.6802-10-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321081355.6802-10-quan@os.amperecomputing.com>
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Phong Vo <phong@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Thu Nguyen <thu@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 21, 2022 at 03:13:55PM +0700, Quan Nguyen wrote:
> Add documentation for the Ampere(R)'s Altra(R) SMpro sysfs interfaces
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Changes in v7:
>   + First introduce in v7     [Greg]
> 
>  .../sysfs-bus-platform-devices-ampere-smpro   | 133 ++++++++++++++++++
>  1 file changed, 133 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> new file mode 100644
> index 000000000000..9bfd8d6d0f71
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-bus-platform-devices-ampere-smpro
> @@ -0,0 +1,133 @@
> +What:		/sys/bus/platform/devices/smpro-errmon.*/errors_[core|mem|pcie|other]_[ce|ue]

Please split this out as one entry per file.

> +KernelVersion:	5.14

5.14 is a long time ago.

> +Contact:	quan@os.amperecomputing.com
> +Description:
> +		(RO) Contains the 48-byte Ampere (Vendor-Specific) Error Record, see [1]
> +		printed in hex format as below:
> +
> +		AA BB CCCC DDDDDDDD DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD \
> +		   DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD DDDDDDDDDDDDDDDD
> +		Where:
> +		  AA       : Error Type
> +		  BB       : Subtype
> +		  CCCC     : Instance
> +		  DDD...DDD: Similar to the Arm RAS standard error record

No, this is not a valid sysfs file, sorry.  This should just be one
value per file.


> +
> +		See [1] below for the format details.
> +
> +		The detail of each sysfs entries is as below:
> +		+-------------+---------------------------------------------------------+
> +		|   Error     |                   Sysfs entry                           |
> +		+-------------+---------------------------------------------------------+
> +		| Core's CE   | /sys/bus/platform/devices/smpro-errmon.*/errors_core_ce |
> +		| Core's UE   | /sys/bus/platform/devices/smpro-errmon.*/errors_core_ue |
> +		| Memory's CE | /sys/bus/platform/devices/smpro-errmon.*/errors_mem_ce  |
> +		| Memory's UE | /sys/bus/platform/devices/smpro-errmon.*/errors_mem_ue  |
> +		| PCIe's CE   | /sys/bus/platform/devices/smpro-errmon.*/errors_pcie_ce |
> +		| PCIe's UE   | /sys/bus/platform/devices/smpro-errmon.*/errors_pcie_ue |
> +		| Other's CE  | /sys/bus/platform/devices/smpro-errmon.*/errors_other_ce|
> +		| Other's UE  | /sys/bus/platform/devices/smpro-errmon.*/errors_other_ue|
> +		+-------------+---------------------------------------------------------+
> +		UE: Uncorrect-able Error
> +		CE: Correct-able Error
> +
> +		[1] Section 3.3 Ampere (Vendor-Specific) Error Record Formats,
> +		    Altra Family RAS Supplement.
> +
> +
> +What:           /sys/bus/platform/devices/smpro-errmon.*/errors_[smpro|pmpro]
> +KernelVersion:	5.14
> +Contact:	quan@os.amperecomputing.com
> +Description:
> +		(RO) Contains the internal firmware error record printed as hex format
> +		as below:
> +
> +		A BB C DD EEEE FFFFFFFF

Again this isn't a good sysfs entry.  You should never have to parse a
sysfs file except for a single value.

thanks,

greg k-h
