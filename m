Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6E01413BE
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 22:55:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zvy24wG7zDr1f
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 08:55:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=james.feist@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zvxG6h8tzDqsp
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 08:54:57 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 13:54:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; d="scan'208";a="274511734"
Received: from skyhawk.jf.intel.com (HELO [10.54.51.81]) ([10.54.51.81])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jan 2020 13:54:47 -0800
Subject: Re: OpenBMC Source-Level Debugging
To: John Chung <gorojohn17@gmail.com>, openbmc@lists.ozlabs.org
References: <CA+a15-UkHByO=6psLogPLpoPkaRCpCwVer_sswudwcm_nTBvjQ@mail.gmail.com>
From: James Feist <james.feist@linux.intel.com>
Message-ID: <0f56ce8a-a440-dbe8-b9ce-157c6f6185ee@linux.intel.com>
Date: Fri, 17 Jan 2020 13:54:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CA+a15-UkHByO=6psLogPLpoPkaRCpCwVer_sswudwcm_nTBvjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 1/14/20 5:02 AM, John Chung wrote:
> Hi All,
> 
> I am doing a personal study on OpenBMC recently. And I am wondering that 
> how to do source-level debugging via gdb, especially in vscode (Not sure 
> it is possible or not).

This is how I get gdb running, there may be (probably are) better ways:

1. Add IMAGE_INSTALL_append +=  "gdb" to the end of your local.conf to 
get gdb in the image.
2. devtool modify 'package' to modify package
3. scp 
build/workspace/sources/<package-name>/oe-workdir/packages-split/<package-name>-dbg/usr/bin/.debug/<application-name> 
onto image to get symbols.
4. gdb pacakge
5. symbol-file <file you just scpd>

Not sure about vscode usage.

-James

> 
> If anyone has any experience or documentation, please kindly let me know.
> 
> Very appreciated for the help.
> 
> Thanks,
> John
> 
> 
