Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E78EF91045C
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 14:45:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=MPKVkQoK;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=cZaYtC/E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4gFZ1Jl7z3bhD
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2024 22:45:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=MPKVkQoK;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=cZaYtC/E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.253; helo=mta-03.yadro.com; envelope-from=a.filippov@yadro.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 527 seconds by postgrey-1.37 at boromir; Thu, 20 Jun 2024 22:45:04 AEST
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4gDw07Ymz30WJ
	for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2024 22:45:03 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 0D2BEE000D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1718886968; bh=UOuPXwpGJL3HwwUp7jUTOtP111eav4bEO18YmsG5mR4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=MPKVkQoKbgBPqd05cZYZbOO21zy7dIMnq91xw0PdVA3Gg/pUp7WIPV4tr/c9ssLW1
	 D2pik2MJgmW/9HxiDr9KdZbvAyQc1LAFwgxgKpAe7LVLhUjG6tU0NNiYGiUMtoEvve
	 SG65QLcSLVqwsZwZB3ZBnpXxffn0xZ3mEOEp4vR2XriAkSBdv3OQdNxG54PYetzipR
	 vG2ruJsaMtTggeQOlcqIKrma1H04+f/Y69yPLDOLhhIeLC/ABamfN6wfnrJyT43K5u
	 n6237sGoVGOvLxQF2XE+IlZWshmTBKu3ryoQs0BsRW1ZFVFJNrCJ6gHpQ2kDdt2gwa
	 UBkSkvalmed/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1718886968; bh=UOuPXwpGJL3HwwUp7jUTOtP111eav4bEO18YmsG5mR4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=cZaYtC/ETccQWh4UL7qBUZIfrlGE/uhb8F8FDZiQagKk8nI+d/e3KYsMWuFSEiGVJ
	 0bteSsGXO13YXa+cl0QIg5yhOpNkU41SQT9hDH2N1GrtvHY/jVgBefTNjU/3lqZ6n6
	 TUjAFAzob73IgjNIVkkF67tfBJZ7AG4wyLn/AudLdGvImF+oYJFJ40dqxHxxX5nYfX
	 RLGyHgNLxpYw1Y+4yThQOsy7zRsC4gm0EAW15BYaMTQOhKyB+1QdT2B4Vl2hNd9gSD
	 iROtcoUnAcHSoq+lTlmsvMKfe3LqncLohIyziUGJ6CiTchPfJc5e1rPtUsJP4z9wQq
	 kvSMULplc0UTg==
Date: Thu, 20 Jun 2024 15:36:06 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Bala Subramaniyan <Bala.Subramaniyan@ltts.com>
Subject: Re: Help with IPMB (IPMI over I2C).
Message-ID: <ZnQiNlMOYE0ATrKK@nbwork.lan>
References: <MA1PR01MB4308AF26A122B17FCC91768C80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <MA1PR01MB4308AF26A122B17FCC91768C80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
X-ClientProxiedBy: T-EXCH-10.corp.yadro.com (172.17.11.60) To
 T-EXCH-09.corp.yadro.com (172.17.11.59)
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
Cc: Thangaraj S <Thangaraj.S@ltts.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Lalit Kumar <Lalit.Kumar2@ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2024 at 10:43:59AM +0000, Bala Subramaniyan wrote:
> Hi All,

Hi,

> 
> For one of our requirement (BMC to BMC, IPMI over I2C), We're exploring with IPMITOOL<https://github.com/openbmc/ipmitool>.
> 
> Development Board: ASPEED AST2600 EVB
> 
> Could you please suggest us how to proceed further with our below requirement.
> 
>   1.
> BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.
>   2.
> Send/Receive IPMI commands through IPMITOOL<https://github.com/openbmc/ipmitool> from one BMC to other.
>   3.
> Send/Receive SDR, SEL logs between two BMC's.
> 
> Any help would be highly appreciated.
> 
> 

As I can see, ipmitool has no any interfaces using i2c directly and I never
listen about using i2c as the ipmi transport.

Google shows me that the similar question already exists and answered:
  https://github.com/ipmitool/ipmitool/discussions/296

As an alternative, You could use lan/lanplus interfaces to communicate with
remote BMC via ethernet.


> 
> Thanks, and regards,
> Bala Subramaniyan M,
> 
> 
> 
> [cid:59c4f387-285c-4c0f-ada0-09714ca611a9]<https://www.ltts.com/>
> 
> 
> S1 Building, L&T Tech Park, Bellary Road,
> 
> Next to Raintree Boulevard, Park View Layout,
> 
> Byatarayanapura, Bengaluru-560092
> 
> Mobile: +91 9677035467
> 
> ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>
> 
> 
> 
> [Ltts.com]
> 
> L&T Technology Services Ltd
> 
> www.LTTS.com
> 
> L&T Technology Services Limited (LTTS) is committed to safeguard your privacy. Read the appropriate privacy notice<https://www.ltts.com/privacy-policies-notices> applicable to you to know more about how LTTS collects, uses and stores your personal data. Please visit our privacy policy<https://www.ltts.com/data-privacy-policy> available on our website www.Ltts.com for more information about our commitment towards data privacy under applicable data protection laws. This email may contain confidential or privileged information for the intended recipient(s). If you are not the intended recipient, please do not use or disseminate the information, notify the sender and delete it from your system.

--
Regads,
Alexander Filippov



