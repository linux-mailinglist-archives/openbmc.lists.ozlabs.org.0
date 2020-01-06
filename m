Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCFB131C5C
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 00:28:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sBXF5XPVzDqGt
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 10:28:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=stwcx.xyz
 (client-ip=136.143.188.51; helo=sender4-of-o51.zoho.com;
 envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=stwcx.xyz header.i=patrick@stwcx.xyz header.b="J7gkVJci";
 dkim-atps=neutral
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sBWD211hzDqFF
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 10:27:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1578353248; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ATon+DCSDF+eQOLhqpdLenFOfNF7sGJQDpLRS6jGAw7NiUXHIWny4JI1a04+SneHUM62WjYR02Q5SmT5rXYvnFO6V0y/3i5zoIcga34A/UHg4QStlGsY4HHrhYv8CuvE8zcza301WkD0CqP6cjU6J3E4XK+wcSRBRjrvhUBtcOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; 
 t=1578353248; h=Content-Type:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=dTUda17Up3j7tuhBr73Yvaub2WX7CJ1H7FgPHv1IgRU=; 
 b=f3Kw26xFUuaBnalSo6d3u3fPtqL2d6PIVhqqhmaNlerzfcGdxpEWp1RPzZfbSZ24ihwe0yJpCrj+efFNgPxHBKG0ycB20taKJPrl/nu9lMBFmb1bKaSLGWio7U1cagAylNyNP+KlYhh9xb+353Nq1ZbIFNvAVFZXF+oXtxphp58=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=stwcx.xyz;
 spf=pass  smtp.mailfrom=patrick@stwcx.xyz;
 dmarc=pass header.from=<patrick@stwcx.xyz> header.from=<patrick@stwcx.xyz>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1578353248; 
 s=zoho; d=stwcx.xyz; i=patrick@stwcx.xyz;
 h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type;
 bh=dTUda17Up3j7tuhBr73Yvaub2WX7CJ1H7FgPHv1IgRU=;
 b=J7gkVJci/1pwx4oL37ywmtTasD9pIxysSOsRydrlxYcn/X0AMsJ1VRRjv4knXGNy
 hZ2IpIp7yjCFPXdeFlzJTi0xUslQrz2lN6F0NsPrVY4xsuwzzJB0XDhBD+SVnbuksJR
 VNvsZgeAo1SZ6iDCjgth5MX0rmq1rbfJzrwdbqEc=
Received: from localhost (163.114.130.128 [163.114.130.128]) by mx.zohomail.com
 with SMTPS id 157835324471863.91117957042252;
 Mon, 6 Jan 2020 15:27:24 -0800 (PST)
Date: Mon, 6 Jan 2020 17:27:22 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Aspeed SPI driver upstreaming
Message-ID: <20200106232722.GB1233@patrickw3-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
Cc: taoren@fb.com, clg@kaod.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Cedric, Joel,

There is currently the aspeed-smc driver[1], which is upstreamed, but only
supports spi-nor devices.  There also a more generic spi-aspeed
driver[2], which might only exist in Facebook kernel trees, that
supports all spi devices but it doesn't do the calibration work.

I made some changes to the spi-aspeed driver recently in order to get it
to somewhat support TPM 2.0 devices (*).  The spi-aspeed driver also
already supported generic spi-nor MTD devices, but just at a slower
speed than aspeed-smc due to missing the calibration routines.

Tao mentioned to me that there was a discussion at one of the F2F events
in 2019 about combining those two drivers and getting them upstreamed,
but that the hang-up was getting upstream mtd and spi subsystems to
agree on how to handle calibration routines in the spi subsystem?  I
can't seem to find anything about this on the LKML.  Do either of you
know where that discussion went and what the current state / plans of
upstreamming a generic Aspeed SPI driver are?

[1] https://github.com/openbmc/linux/blob/dev-5.3/drivers/mtd/spi-nor/aspee=
d-smc.c
[2] https://github.com/facebook/openbmc-linux/blob/dev-5.0/drivers/spi/spi-=
aspeed.c

(*) The Aspeed SPI master is half-duplex and the TPM SPI spec effectively
    requires full duplex hardware.  I did some workarounds to get it to work
    with one particular part and need to work with the vendor and upstream
    to figure out the best way to reliably handle half-duplex SPI masters.
--=20
Patrick Williams

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4TwlcACgkQqwNHzC0A
wRmf/Q//QXQRkt/4zqILYb/ztJeEqfU9ALYrKFYnRweBpW6/Zsd7SZ7hpK5tjbIk
WhQOMKTvKiixbRF6HyPAfUf+z50rb0Kd/obSPgppmsfwxTtXVA+Nxu5KEk2zp7OG
zjvmjtjK2YLc+Fz/XwT88tt0SkRUjFoIPtWg/Pz5Mtjp09gcniSVeBkklGzJacKR
0HGLNa3SkBswofd3wbEOUFdi47SPwWsLnCXe0oMCjf4CJJRPZls/h48iJEvY7kRZ
0IrpPS8kAHyTrkZ/iYkIuZCTKMuWY1tOxED4KIvbFLvsoqMiuJDimL452Qaczst1
VdWATvzJ+O1luMeBl87EscimhOwKXEhOW80ZmunCF7LUnfPyZ1vp728jAGCf9fQ8
p56B0AgKMRLZLF5eGVgCQHxw8yLa0mUDpyJCMkVz9iAw4Cpm0J7eDxuq5OAh+/Jf
QW53C4UPH42PeqaWdCAzxgydR2mRO9RYgnBR/2U/1IhVzKzPRMKbcHJ/3+GdG0Pe
QstNgXOdhME0Ac/HG4/jx7yxKVOSMkeebWwPFuIsTcBIyP6q/2G97y8sMffxL/KE
/mmERDfSoNoA90D4Q2aiJUv6GMWz1w4x5HaWSsRR1bhm6SoKf1DvvzBu+sUVf2Mh
9LJfWYyxu2F3i20XLWHcEDDvjCDef3Q0s6h03ja7ymaC7NOk9Dc=
=qPGb
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--

