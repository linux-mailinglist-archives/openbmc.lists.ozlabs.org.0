Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1FB46FA0B
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 06:03:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9Jgs4Skyz3c56
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 16:03:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=iMwiIg6q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=iMwiIg6q; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J9JgS08kMz30Hj
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 16:02:43 +1100 (AEDT)
Received: by linux.microsoft.com (Postfix, from userid 1046)
 id C72FD20B7179; Thu,  9 Dec 2021 21:02:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C72FD20B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1639112528;
 bh=kWOzrofeNeU/9zQIXLq/G5snXg+LlIbcBpD07+CBuJk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iMwiIg6q3/vWIj79kxNkgoH2Ecl3jBcOxsY7N9WaxKjMTu9oPdVQVJ1DBGeaLpOlN
 IidmnXNgTpUKTZzMW8VrRHL+jg9Qxe16BUSqt7+iGdLHeUL1vXHBFbbjPB3Rh3TH/H
 7FToQeGrMF3CBWqM7xY8uwT1K/426FGml1nAYkfE=
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
To: andrew@aj.id.au
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
Date: Thu,  9 Dec 2021 21:01:58 -0800
Message-Id: <1639112518-8080-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
References: <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
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
Cc: openbmc@lists.ozlabs.org, dphadke@linux.microsoft.com, jrey@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 10 Dec 2021, Andrew Jeffery wrote:

> There's not much documentation as yet. p10bmc can be used as an example
> of a system that enables it.
>
> https://github.com/openbmc/openbmc/blob/ade3e145ead0beedad181394fcaa63856176bdee/meta-ibm/conf/machine/p10bmc.conf#L39-L56
>
> Given the lack of documentation it's probably also reviewing these
> patches in the context of the configuration above:
>
> https://gerrit.openbmc-project.xyz/q/topic:%22secure-boot%22+(status:open%20OR%20status:merged)

Thank you for the pointer, I'll comments there.

>> Need clarity regarding OTP programming.
>> (1) There's Linux tool
>
> I assume this refers to socsec? The socsec repo provides two tools:
> `socsec` and `otptool`. `otptool` can be used to generate the OTP image
> and exercise signature validity.
>
> https://github.com/AspeedTech-BMC/socsec/

Yes, I was referring to these tools, socsec-sign.bbclass seems to cover
the workflow I was looking for.

>
>> and U-Boot patches floating somewhere.
>
> I'm not sure what patches you're referring to here, can you clarify?

https://github.com/AspeedTech-BMC/u-boot/commits/aspeed-master-v2019.04

cmd/otp.c has more changes compared to openbmc/u-boot.

>
>> (2) Any specific OTP straps preferred by OpenBMC, e.g. enabling alt
>> boot (ABR).
>
> There's no real preference. My intent is to add a recipe that can
> consume a platform-specific otptool json config and spit out the OTP
> binary as a build artefact. Currently I just have the config captured
> in a separate repo internally and I generate binaries from that using
> make.

This is useful, having readable config and letting platform select
behavior such as alternate image in same SPI or alternate, etc.

Regards,
Dhananjay

