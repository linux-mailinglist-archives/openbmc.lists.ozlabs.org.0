Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E56D610E16
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 12:07:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzJBB293bz3cFC
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 21:07:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=DVEnt5h4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4.zoho.com; envelope-from=nikhil.vu@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=nikhil.vu@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=DVEnt5h4;
	dkim-atps=neutral
X-Greylist: delayed 908 seconds by postgrey-1.36 at boromir; Fri, 28 Oct 2022 21:06:43 AEDT
Received: from sender4.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzJ9b4qZYz3bkZ
	for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 21:06:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666950691; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CITmftn6JXAgzsW46igrzIgs2KuPxc0HQA8XrOoe0J2oaA7uddsI1nYtm6w3HE/m44doOhe/R6IG1fRDOHboXTtcO+RH881ZamExWqZqCuKBF6uLdcE8m8aiDb3k5KX9D5Kw9pFDgmLT2nG5s1cVz39QlrowyuZNffNfnynZ1uM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1666950691; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=y3usDZowwZNBmEK1kpJn8jJ70tCCn5WcjGPTBC2A5qI=; 
	b=gF+fARprolY0T2jm+ktSz00L9MeyXNFbwEiVxYjBlIffecU4FkAu1rhLqkn6AfB349iSOrLMgYzqrGo8TCTpNm8+TsGNKysva3gDl1FqxE2RCjdEy4Cp0Y84NQQ8trEHSziIAFCzQIp64fPnq56ulIa33bUO1pAjf2JLI2hkdDQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohocorp.com;
	spf=pass  smtp.mailfrom=nikhil.vu@zohocorp.com;
	dmarc=pass header.from=<nikhil.vu@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666950691;
	s=admin; d=zohocorp.com; i=nikhil.vu@zohocorp.com;
	h=Date:Date:From:From:To:To:Message-Id:Message-Id:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Reply-To:Cc;
	bh=y3usDZowwZNBmEK1kpJn8jJ70tCCn5WcjGPTBC2A5qI=;
	b=DVEnt5h41LycDi05+6KAKX1ZyU3aKq0TpxU9sKzskOjcaLJkmstS53PDSBTAsYdp
	dsVsAsv/Z5GTFR2LLLJqNvI7rYbScS9vYpLB8U0RCdizQ+/Dq0YW1caqRwFgzrnb7AQ
	J3Jiyz/mKzK4HHeOc5A+HKfyiHzVdriSnQQBLmBA=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1666950689922803.3063454078108; Fri, 28 Oct 2022 02:51:29 -0700 (PDT)
Date: Fri, 28 Oct 2022 15:21:29 +0530
From: Nikhil V <nikhil.vu@zohocorp.com>
To: "openbmc" <openbmc@lists.ozlabs.org>
Message-Id: <1841e00f475.fd648575116781.6157445050168975217@zohocorp.com>
In-Reply-To: 
Subject: openbmc booting from external QSPI NOR Flash
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_385654_1947589373.1666950689909"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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

------=_Part_385654_1947589373.1666950689909
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I have successfully boot openbmc=
 on beaglebone with Sd card. Now I want to boot openbmc from external QSPI =
NOR Flash. I have also set the boot sequence to boot from external flash.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I am unable to identify how crea=
te image for SPI Flash, or what are the steps to carried out to load image =
in external qspi flash.

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Any pointer will be helpfu=
l.





Thanks & Regards,

Nikhil Muley
------=_Part_385654_1947589373.1666950689909
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head><meta content="text/html;charset=UTF-8" http-equiv="Content-Type"></head><body ><div style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;"><div><br></div><div>Hi all,<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have successfully boot openbmc on beaglebone with Sd card. Now I want to boot openbmc from external QSPI NOR Flash. I have also set the boot sequence to boot from external flash.<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am unable to identify how create image for SPI Flash, or what are the steps to carried out to load image in external qspi flash.<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Any pointer will be helpful.<br></div><div><br></div><div><br></div><div>Thanks &amp; Regards,<br></div><div>Nikhil Muley<br></div></div><br></body></html>
------=_Part_385654_1947589373.1666950689909--

