Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1724310EC1D
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2019 16:14:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RTCm56bKzDqNs
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 02:13:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="bYAlIU69"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RTBy3sYZzDqNF
 for <openbmc@lists.ozlabs.org>; Tue,  3 Dec 2019 02:12:56 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 17C30411FD;
 Mon,  2 Dec 2019 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1575299565; x=
 1577113966; bh=IeXAh5Vj75f84tDdVXm2D3ffA4xLBK6PQa2oD2KWkXY=; b=b
 YAlIU6912Axh9sAU12yh66ri5wbpNxrdELnaoQP7birRHtDeBZ3UOJQPQTGaI4je
 9D463H9gwj4NbjsxQXi3pTFuDdrdCa1bbWdWcDeL2fEwWIe0EJrtlgtqHZ/dP0C5
 wPZ0AcmvbpgL53KpnhQmi5dXFAPeed93+9MJGIaceY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wb0vBr2_DaJv; Mon,  2 Dec 2019 18:12:45 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CF767411F8;
 Mon,  2 Dec 2019 18:12:45 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 2 Dec
 2019 18:12:45 +0300
Subject: Re: license conflicts with OpenSSL
To: Yong Li <yong.b.li@linux.intel.com>, <openbmc@lists.ozlabs.org>
References: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>
 <b0b878b8-ff90-9e22-2831-44b086c0d8a2@yadro.com>
 <002701d5a8ac$fe40d280$fac27780$@linux.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <e90e0947-6024-7967-f62f-43f899ed0764@yadro.com>
Date: Mon, 2 Dec 2019 18:12:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <002701d5a8ac$fe40d280$fac27780$@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WFHj3y78mAc8GAdFiFclZolkxQtlwocjG"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

--WFHj3y78mAc8GAdFiFclZolkxQtlwocjG
Content-Type: multipart/mixed; boundary="2NYUaJiuKXeATY16O2ce3n6Mw5NNIjEAs";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Yong Li <yong.b.li@linux.intel.com>, openbmc@lists.ozlabs.org
Message-ID: <e90e0947-6024-7967-f62f-43f899ed0764@yadro.com>
Subject: Re: license conflicts with OpenSSL
References: <000001d5a682$2b3fabd0$81bf0370$@linux.intel.com>
 <b0b878b8-ff90-9e22-2831-44b086c0d8a2@yadro.com>
 <002701d5a8ac$fe40d280$fac27780$@linux.intel.com>
In-Reply-To: <002701d5a8ac$fe40d280$fac27780$@linux.intel.com>

--2NYUaJiuKXeATY16O2ce3n6Mw5NNIjEAs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

02.12.2019 4:08, Yong Li wrote:
> Thanks Alexander for your quick response!
>
> My understanding is that you will perform some changes in the upstream
> https://github.com/ipmitool/ipmitool, to remove these unused/obsolete
> dependencies.

You're correct. I've already posted a PR to remove the ncurses dependency=
:
https://github.com/ipmitool/ipmitool/pull/175

I'd like at least Vernon to approve it before I merge it into master.

> But I notice the ipmitool_1.8.18.bb file in openembedded is using these=

> .tar.bz2 files from sourceforge.net. Just want to know do you upload th=
e new
> versions to sourceforge.net?

No, the sourceforge.net is abandoned and will not be updated.

New releases will be available at https://github.com/ipmitool/ipmitool/re=
leases

I don't yet have any schedule for the next release though.

WBR, Alexander.




--2NYUaJiuKXeATY16O2ce3n6Mw5NNIjEAs--

--WFHj3y78mAc8GAdFiFclZolkxQtlwocjG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJd5SnsAAoJEOiTWHtbdBeNr40P/iyxA5mHoQ4GJ7u7Tt5GLI/z
csomDWiorFCW+LZuaCq5lGtU8rO125y0SncGA8p/XiDpK/4z4fFNnOBKE1R2fUEV
e98QJWB8K1tCDXXlblsEI1XlxfVafaC0zCuPkKJksrjyEwgvEjhutJgLBmSd6VUo
aVIbdjEPht/stDfTtzf3dAkIGloJtaxZY6DRxGrNDdvWpT391LVUlLnUId0HhBym
KbhBFtF4amdhuGe2ii/L05oWZif8emxxflC3AHdbcvrujPwGm4T25yzyNnkTpDTb
enOvEfTwJ/DpYQBLkwA4M5Q3pP5+vteNNJa1NJ4SFNuaUJi43S0onvaL/z+vQaA4
cZnjxdg2sHsTx+dxfvfy4HRhD0NGC+bWlNqtjWazQyP/xt1VYPMHSAD5AocBb8QN
w88Fgmg+WH9hl6Cd3x4rx54BUh5y9Xm6xYpxH0d/ujjaalgczXgQJ6ozu9VbaqgR
o9goiUvnbFFjEop0YC36DnMUOgxfPaUMgdQ0Y4jbYYcNQDcAAu5+L90B6vEltmqp
IMSXajO4dWwvNXWVwySIIoA+eNaW6ZHbjB6OU+MhVG/gEEkYTSgDzg+EPB5IaaRL
n1JNvrjx8y2AsoFMJqxeA1z4rMe6+rbfmg2jBm2rTLynG3fIRjCUaRiRDOp3ieRV
8D3/sPx4UQwpRvohaD2h
=LvH+
-----END PGP SIGNATURE-----

--WFHj3y78mAc8GAdFiFclZolkxQtlwocjG--
