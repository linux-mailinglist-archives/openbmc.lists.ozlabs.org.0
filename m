Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E1A1413E7
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 23:06:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zwB913jxzDr1d
	for <lists+openbmc@lfdr.de>; Sat, 18 Jan 2020 09:06:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jason.m.bills@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zw986GybzDqwY
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jan 2020 09:05:16 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 14:04:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,331,1574150400"; d="scan'208";a="243803707"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 17 Jan 2020 14:04:49 -0800
Received: from [10.241.245.65] (unknown [10.241.245.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C6FC15803DA
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 14:04:49 -0800 (PST)
Subject: Re: OpenBMC Source-Level Debugging
To: openbmc@lists.ozlabs.org
References: <CA+a15-UkHByO=6psLogPLpoPkaRCpCwVer_sswudwcm_nTBvjQ@mail.gmail.com>
 <0f56ce8a-a440-dbe8-b9ce-157c6f6185ee@linux.intel.com>
From: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Message-ID: <0873bd61-150e-f64b-7c94-0e7112f39426@linux.intel.com>
Date: Fri, 17 Jan 2020 14:04:49 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0f56ce8a-a440-dbe8-b9ce-157c6f6185ee@linux.intel.com>
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



On 1/17/2020 1:54 PM, James Feist wrote:
> On 1/14/20 5:02 AM, John Chung wrote:
>> Hi All,
>>
>> I am doing a personal study on OpenBMC recently. And I am wondering 
>> that how to do source-level debugging via gdb, especially in vscode 
>> (Not sure it is possible or not).
> 
> This is how I get gdb running, there may be (probably are) better ways:
> 
> 1. Add IMAGE_INSTALL_append +=  "gdb" to the end of your local.conf to 
> get gdb in the image.
> 2. devtool modify 'package' to modify package
> 3. scp 
> build/workspace/sources/<package-name>/oe-workdir/packages-split/<package-name>-dbg/usr/bin/.debug/<application-name> 
> onto image to get symbols.
> 4. gdb pacakge
> 5. symbol-file <file you just scpd>
> 
> Not sure about vscode usage.
> 
> -James
I had some minimal success getting remote GDB working.  Here are the 
notes that I kept:
1. Add 'IMAGE_INSTALL_append += " gdbserver"' to /local/local.conf
2. Build 'gdb-cross-arm' recipe without python
	a. If libreadline.so.7 error, 'export LD_LIBRARY_PATH=<path to 
libreadline.so.7>'
3. On Target, run 'gdbserver localhost:9999 <app to debug>'
4. On Host, run 'arm-openbmc-linux-gnueabi-gdb <app to debug with symbols>
	a. Then run 'target remote <ip>:9999'
	b. Then run 'continue' to start app on target
		
https://www.linux.com/news/remote-cross-target-debugging-gdb-and-gdbserver
https://stackoverflow.com/questions/21928876/gdb-can-not-load-source-file

I believe for step 2, I modified the PACKAGECONFIG to disable python.

Sorry that the notes are a little rough, and it's been a while since I 
tried this, so ymmv.
-Jason

> 
>>
>> If anyone has any experience or documentation, please kindly let me know.
>>
>> Very appreciated for the help.
>>
>> Thanks,
>> John
>>
>>
