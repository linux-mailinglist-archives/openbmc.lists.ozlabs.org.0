Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C65FB0F1
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 13:07:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmtKP6DHWz3c70
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 22:07:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zohocorp.com header.i=pratik.a@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=Qa+lZ+Dc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zohocorp.com (client-ip=136.143.188.7; helo=sender4.zoho.com; envelope-from=pratik.a@zohocorp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zohocorp.com header.i=pratik.a@zohocorp.com header.a=rsa-sha256 header.s=admin header.b=Qa+lZ+Dc;
	dkim-atps=neutral
X-Greylist: delayed 906 seconds by postgrey-1.36 at boromir; Tue, 11 Oct 2022 17:14:55 AEDT
Received: from sender4.zoho.com (sender4-zc7.zoho.com [136.143.188.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mmlqz0pJ3z2xJN
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 17:14:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665467984; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=I2CxCcmNMtVh8J1houyvI6Uo7r1mqEB6Ju4ZvFzuijd2kPq+56WzKE20Opy9Kw+2DKV99opzi7Zr04c2L9vBqZfA4y+gnly0vX33EIc0LYrspC97PWb+9cYIcuBw1HSiv6HQF4xOiNUO2q5ceGsiwo94erlKgKx7qyOd2mQkG0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1665467984; h=Content-Type:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=F/x84cJ/Kzycf4wH2rx/Lj3tUqN9gqSS4+7sr/3E0k4=; 
	b=R5p7sqBBc4+sDGYd+u4psxLfjIy5EnOGqTtYL0HpzWKJDCFJB5mLhUgV7a4EWjuBecsOAP4zdTZbjoqjgLDlC0sK3pA4ZUYUWLXRa8UKxligNfweeBJVki5Fyn6n5Y0oX7VEErxsoU2n9XNp5bFQ0XSut1ESkWfRU6EuvHyQPho=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohocorp.com;
	spf=pass  smtp.mailfrom=pratik.a@zohocorp.com;
	dmarc=pass header.from=<pratik.a@zohocorp.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1665467984;
	s=admin; d=zohocorp.com; i=pratik.a@zohocorp.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-Id:Message-Id:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Reply-To;
	bh=F/x84cJ/Kzycf4wH2rx/Lj3tUqN9gqSS4+7sr/3E0k4=;
	b=Qa+lZ+DcFmUJcmWIEkW+tWCVSTDORuCOF8osw8c0Z2P6oCBmcIXSzKeStbrF9Do9
	dYDa2CA/Ef9/ZHolkro70r7TL9bs2LVUrhtB/7dsrbpXLcUud1p/vYof6VGKDB+UJhE
	vXvoyZiqUFYPChcJgKHqkrqbsq938ioPaKImPoSA=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1665467982552818.2338753830705; Mon, 10 Oct 2022 22:59:42 -0700 (PDT)
Date: Tue, 11 Oct 2022 11:29:42 +0530
From: Pratik Adle <pratik.a@zohocorp.com>
To: "OpenBMCSupport" <OpenBMC.Support@intel.com>,
	"openbmc" <openbmc@lists.ozlabs.org>
Message-Id: <183c5a0a2bd.fc1aec47188934.9210721628492674063@zohocorp.com>
In-Reply-To: 
Subject: OpenBMC for Brighton City (Idaville platform)
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_625618_628953123.1665467982525"
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Tue, 11 Oct 2022 22:06:54 +1100
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
Cc: Dilraj N <dilraj.n@zohocorp.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_625618_628953123.1665467982525
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,



We would like to build OpenBMC for Brighton City which is based 
on ICX-D (Idaville platform).



In https://github.com/Intel-BMC/openbmc/, there is no specific meta layer for Idaville platform.

So, can you help us to get started with OpenBMC for Brighton City?



Regards,

Pratik
------=_Part_625618_628953123.1665467982525
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head><meta content="text/html;charset=UTF-8" http-equiv="Content-Type"></head><body ><div style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt;"><div>Hi,<br></div><div><br></div><div>We would like to build OpenBMC for Brighton City which is based 
on ICX-D (Idaville platform).<br></div><div><br></div><div>In <a href="https://github.com/Intel-BMC/openbmc/" target="_blank">Intel-OpenBMC github</a>, there is no specific meta layer for Idaville platform.<br></div><div>So, can you help us to get started with OpenBMC for Brighton City?<br></div><div><br></div><div>Regards,<br></div><div>Pratik<br></div></div><br></body></html>
------=_Part_625618_628953123.1665467982525--

