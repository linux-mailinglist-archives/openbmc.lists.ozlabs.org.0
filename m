Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8484ECD6
	for <lists+openbmc@lfdr.de>; Fri,  9 Feb 2024 00:19:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EHlYMRRL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWCcH32rXz3cM5
	for <lists+openbmc@lfdr.de>; Fri,  9 Feb 2024 10:19:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=EHlYMRRL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWCbk0Pn4z2y1Y
	for <openbmc@lists.ozlabs.org>; Fri,  9 Feb 2024 10:18:57 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-182-175.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.175])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2A1CD200DB;
	Fri,  9 Feb 2024 07:18:54 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1707434335;
	bh=TpejIxWAIjWlU/oEX71Qtldncssryz6UsHVu4rf7uK0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EHlYMRRL1REICKpSeDWoOoaCefvRTEiHEGDtKNznqvctlAwCPxxSnZKZEqGgoGaFF
	 eqDlZX+Rj5t6ivx/MbZGgxv1jXa0VVXLIP7X8iOsmVSAMwEFxu8Iy2/w+rhbLy+DgL
	 DwWNdm2kKUAG8EfdrNhTv4xcbQq+AwHF2+d0NC7u9uqrANBoOeZ5d88UyrlVsWvt0x
	 6ixzopoQMh0edmlfk/NkBAWfow6ICxTPRPzcdjkPh6RZiMwJ6Z/t1Klg/9pZ9bTpEs
	 kz7GUOS7f4kM2wV6kwbwIOTveYQG6X9vwuqrBI8ur+4lqJmYSO6i5jr4XZUGECtwSQ
	 pEODTS77zPF+w==
Message-ID: <34f3ba2f2279f5c63b20b7dc0da80f3de53a0768.camel@codeconstruct.com.au>
Subject: Re: File Manager Service in OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Sunitha Harish <sunithaharish04@gmail.com>, openbmc@lists.ozlabs.org
Date: Fri, 09 Feb 2024 09:48:50 +1030
In-Reply-To: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
References: <88ba0256-2c86-4727-97b6-dce02ba61554@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: gmills@us.ibm.com, ed@tanous.net, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-02-08 at 12:52 +0530, Sunitha Harish wrote:
> Hi,
>=20
> This email is about adding a FileManager Service in OpenBMC.
>=20
> IBM has usecases implemented under /ibm/v1 path at bmcweb, which uploads=
=20
> and manages files on the BMC. This usecase is being re-designed, to stop=
=20
> bmcweb from modifying and accessing BMC file system directly.
>=20
> To achieve this, a dbus & backend application is needed. This should=20
> provide APIs to Create, Update, Get and Delete a file. This application=
=20
> should also take care of security aspects of the File upload usecases,=
=20
> before letting the BMC file system updated. Please share your views on=
=20
> adding this application.

I'm struggling to make sense of this.

What are we actually trying to achieve? If bmcweb can indirectly write
arbitrary files through this service there's no advantage. Instead we
have a whole bunch of complexity and overhead.

It feels like the GPIO conversation that we seem to have periodically
in the project. I think we need more information on *the use* of the
files you need to upload.

Andrew

