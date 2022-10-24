Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F8460BF8F
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 02:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxCWx54ttz3bjl
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 11:30:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bqEaMY22;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bqEaMY22;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwvm62w3Jz2xjr
	for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 23:39:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 317D06131D;
	Mon, 24 Oct 2022 12:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDFB3C433B5;
	Mon, 24 Oct 2022 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666615185;
	bh=Cqr4+bBL7oNYcnofbEaCz0+7Ljp5GAyhgX+SKELtivc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bqEaMY22acfVwNO2wynM6QjybdGs+CcFDoBsFM3cDIFU+RP3TyvzA9RsAFav3wVTu
	 fCRe1dwk2kiMRIO5Ao/IrtkhHYYGlJzWO8Pul3X1IzNMmvh+7dp2GDlSanQ5yy7kxG
	 Qupf6JuPrH7u++Wi8dsEFNu8BEJ32qaEm9C4WFQaj0f8h4n0LHxZWimIuPMwh21oqa
	 pKZ27Ct2kTlPgXe8xLjFHs7HJtN10XyF+NgZ5jpBYH6zS3mhn/M2K0LTYugV/ohsBm
	 n1xxFcHrQL/A+8paIvPns1Ve66DGcIQqGm6H9ts6ILKrjVj1N69rWXth72FsxaHBEk
	 /HIzltdBcepow==
Date: Mon, 24 Oct 2022 13:39:37 +0100
From: Lee Jones <lee@kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v9 8/9] mfd: Add Ampere's Altra SMpro MFD driver
Message-ID: <Y1aHiaZ1OpHZIzS9@google.com>
References: <20220929094321.770125-1-quan@os.amperecomputing.com>
 <20220929094321.770125-9-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220929094321.770125-9-quan@os.amperecomputing.com>
X-Mailman-Approved-At: Tue, 25 Oct 2022 11:29:54 +1100
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, thang@os.amperecomputing.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Derek Kiernan <derek.kiernan@xilinx.com>, Open Source Submission <patches@amperecomputing.com>, Thu Nguyen <thu@os.amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, macro@orcam.me.uk
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 29 Sep 2022, Quan Nguyen wrote:

> Adds Multi-function devices driver for SMpro co-processor found on the
> Mt.Jade hardware reference platform with Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> 
> Changes in v9:
>   + Rename smpro-mfd.c to smpro-core.c                   [Lee Jones]
>   + Fix include files in alphabetical order              [Lee Jones]
>   + Add defines to avoid using magic numbers             [Lee Jones]
>   + Return -EINVAL if device does not match              [Lee Jones]
>   + Remove unneccessary comment                          [Lee Jones]
>   + Refactor error path handling in smpro_core_read/write()   [Quan]
> 
> Changes in v8:
>   + None
> 
> Changes in v7:
>   + Smpro-mfd now significant changes in compare with simple-mfd-i2c
>     driver, remove the copyright note about simple-mfd-i2c    [Quan]
>   + Install bus->read/write()  to handle multiple types of bus
>     access.                                                   [Quan]
>   + Update license to MODULE_LICENSE("GPL")                   [Quan]
>   + Add others minor refactor the code                        [Quan]
> 
> Changes in v6:
>   + Update license part to reflect that this driver is clone from
>   simple-mfd-i2c driver [Quan]
> 
> Changes in v5:
>   + Dropped the use of simple-mfd-i2c driver [Quan]
>   + Introduced drivers/mfd/smpro-mfd.c driver to instantiate
>   sub-devices. This is to avoid DT nodes without resource issue [Quan]
>   + Revised commit message [Quan]
> 
> Changes in v4:
>   + Add "depends on I2C" to fix build issue found by kernel test
>   robot [Guenter]
> 
> Changes in v3:
>   + None
> 
> Changes in v2:
>   + Used 'struct of_device_id's .data attribute [Lee Jones]
> 
>  drivers/mfd/Kconfig      |  12 ++++
>  drivers/mfd/Makefile     |   1 +
>  drivers/mfd/smpro-core.c | 138 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 151 insertions(+)
>  create mode 100644 drivers/mfd/smpro-core.c

Applied, thanks.

-- 
Lee Jones [李琼斯]
