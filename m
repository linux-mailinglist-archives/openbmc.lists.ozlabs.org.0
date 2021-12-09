Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9AE46F1F6
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 18:32:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J91M36nj7z3bnq
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 04:32:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=a4lgNdv5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=a4lgNdv5; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J91Lh3ppxz3076
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 04:32:12 +1100 (AEDT)
Received: by linux.microsoft.com (Postfix, from userid 1046)
 id 2885920B717A; Thu,  9 Dec 2021 09:31:39 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2885920B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1639071099;
 bh=XkAP9Vi2++vOqJmQGxmARbux3Ozwny1TMw2NX/N5ehI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a4lgNdv5/YNaKRDZkXOw3AiaM4EwWFKMPutQ+Dj+kQu6u9f1xUSQvDCQErkXLIlPr
 Fp/y9N2OsaJIUGmQ+2ul4dyDsUSIDC+yf3Q8nMDOSV66FzoUsZrYWX/oJ/MqHnvBP1
 R/qvHFrTkoD6gGkVLazEo6rwTfXsi02grrIH9YNM=
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
To: jrey@linux.ibm.com
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
Date: Thu,  9 Dec 2021 09:31:37 -0800
Message-Id: <1639071097-7076-1-git-send-email-dphadke@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <7e7f0779-d6c7-99b3-d88a-5a239440984a@linux.ibm.com>
References: <7e7f0779-d6c7-99b3-d88a-5a239440984a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>> On Thu, 9 Dec 2021, at 05:44, Joseph Reynolds wrote:
>>
>>> 4 Progress on BMC secure boot?
>>>
>>> AST2600 hardware secure U-boot  boot, then secure booting the Linux
>>> kernel. No additional pieces.
>>>
>>> See the AST security guide.  How is signing-key management done?
>>>
>>> Dhananjay to  follow up.
>> As someone who was involved in integrating the AST2600 secure-boot support into OpenBMC, what's going on here?
>
>Someone asked the question you see above, and Dhananjay tried to 
>answer.  The consensus was that there is support for AST2600 secure 
>booting U-Boot, support for U-Boot securely loading the Linux kernel, 
>and no additional support.  Your summary would be appreciated.
>
>Is there a document which what a system integrator needs to use this 
>function?  Ideally it would be linked from 
>https://github.com/openbmc/docs/blob/master/features.md

Right, I noted recent submissions to U-Boot and Kernel.
(1) HACE/ARCY support in U-Boot
(2) OTP sysfs access for logging Secure Boot status.

Need clarity regarding OTP programming.
(1) There's Linux tool and U-Boot patches floating somewhere.
(2) Any specific OTP straps preferred by OpenBMC, e.g. enabling alt
boot (ABR).
(3) Any interest in using encryption besides SHA/RSA auth?

Signing of FIT is handled by Yocto/poky anyway.

Dhananjay

