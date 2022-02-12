Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A404B3873
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 23:55:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jx5Rz3X41z3bcS
	for <lists+openbmc@lfdr.de>; Sun, 13 Feb 2022 09:55:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=aWhMdABN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=aWhMdABN; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jx5Rc2xHCz2yPq
 for <openbmc@lists.ozlabs.org>; Sun, 13 Feb 2022 09:55:23 +1100 (AEDT)
Received: from [192.168.86.183] (unknown [50.47.106.53])
 by linux.microsoft.com (Postfix) with ESMTPSA id C869720B96C7
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 14:54:51 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C869720B96C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1644706491;
 bh=Zd0DbVD37U3ccYckXtsCwTHSb+LesYRms+a4rlMBQaY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=aWhMdABNaJ19v2ZlWAXS7cF/qh4vkMPurvKU41IGquT0sKNZUofHNH1pdAL83hbVe
 nNZ8CgQJ+gADIktTalqxqBNy3nVRjHZRTo1KSMFX76nyEeFOGDyy9X2Wj7KesuxVHo
 PA7m8gqQymH5znWHw1HbmRuG6E84QIgD9MA20i1Q=
Message-ID: <016ae207-2ecb-1817-d10e-12819c8c40ef@linux.microsoft.com>
Date: Sat, 12 Feb 2022 14:54:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
Content-Language: en-US
To: openbmc@lists.ozlabs.org
References: <20220131034147.106415-1-andrew@aj.id.au>
 <HK0PR06MB3779465E79CE71DEDB4F5633912C9@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <3c14e608-ca3d-4b79-9dfa-4f65ea1fc742@www.fastmail.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <3c14e608-ca3d-4b79-9dfa-4f65ea1fc742@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2/8/2022 1:55 PM, Andrew Jeffery wrote:
> Right, just as strap pin controlling the SB ROM in the 2600 allows bypass.
> 
> It's just another one of these affecting a different boot stage.

Why would someone leave such external exploit open in production?
Fusing OTPCFG0[6]=1 would ignore external strap and OTPCFG0[1]=1 would 
enable secure boot with no way to bypass.

Regards,
Dhananjay
