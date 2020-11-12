Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D752D2B0656
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 14:22:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX2Md5VRgzDqwN
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 00:22:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=173.167.31.197;
 helo=bajor.fuzziesquirrel.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX2Kc5kY4zDqvp
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 00:20:50 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: New meta-ampere request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <fbcb9c2f-553c-6ebe-d2d1-69dd072a25ad@os.amperecomputing.com>
Date: Thu, 12 Nov 2020 08:20:43 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <F47638BE-9654-4837-9FE3-1AB188CDB04C@fuzziesquirrel.com>
References: <fbcb9c2f-553c-6ebe-d2d1-69dd072a25ad@os.amperecomputing.com>
To: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

at 1:58 AM, Thang Q. Nguyen <thang@os.amperecomputing.com> wrote:

> Hi Brad,
>
> I am from Ampere Computing. We are using the OpenBMC to develop our BMC  
> for our reference platform (with Ampere CPU and Aspeed AST2500).
>
> We need you to help create a new meta-ampere repository for us to start  
> pushing our codes for review.
>
> Below is the information to create new meta-ampere layer:
>
> Maintainers:
>
>     thang@os.amperecomputing.com
>
>     tung@os.amperecomputing.com
>
> Let me know if I miss anything.
>
>
> Best Regards,
>
> Thang Q. Nguyen

Hi Thang - meta-ampere created!

thx - brad
