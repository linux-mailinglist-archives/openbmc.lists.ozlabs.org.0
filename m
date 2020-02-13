Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75725170E38
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:09:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SbhM6SzBzDqkG
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:09:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.co.in (client-ip=106.10.241.37;
 helo=sonic307-20.consmr.mail.sg3.yahoo.com;
 envelope-from=muniswamy_setty@yahoo.co.in; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.co.in
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.co.in header.i=@yahoo.co.in header.a=rsa-sha256
 header.s=s2048 header.b=uH/dUcEX; dkim-atps=neutral
Received: from sonic307-20.consmr.mail.sg3.yahoo.com
 (sonic307-20.consmr.mail.sg3.yahoo.com [106.10.241.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JFxV1Vv2zDqTY
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 23:21:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.in; s=s2048;
 t=1581596501; bh=1ZO/TajOqibFmrHedqK31w68pFl5wFKRvjqgw58bVLw=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject;
 b=uH/dUcEXKScMV1iSNmeGMBs6GH3gu0wTOX8KSfjX2i1XvPz6z3zwDNBDZN/M7hFPOJ1gCDN9nKGkHi3dbn5DbvEOUtfOlBx166STlMoly4E1Ttut6Hnl02wzk+oBV+HJwAMqGHQW6n6rG2E4+JrKHxTb0ihY9R7NcmArWAJgpktJgznLufvOANiiBye/Pi2rjxOp0nPYiHPbKzOorKUYwrtdui28OEtFa79B5Nx0zTOE1FXj2vdFpqHs/6FfFoACU4ghXhLbjfrTJl/5PNhpxtKU6l290Q2+rnTykC9c5MlpO3f6vhEdbylUEAidmdOPqKIw5noAs/CXGMsVNz33BQ==
X-YMail-OSG: GirQ3ykVM1kh2fF.p1cRqvYGJYAxUy.oRTvRnYkQANxvZFBq3i7WVJZn0m.ux2c
 JJNfI8akHs4G5bzGClSnWQm1_bNihFtPapp97G1vTUAEUgy3nrjXUfVbv.143QGsB0Lh6W0kwMBk
 BEYyuj6hkYe3bjfIDPdQOjfpNXLpQBbfCWK9dXxF__2VsRqAh9_BrRqewNBQYNp6BbAaJJsqZsxB
 KgPNXqavYt_3aaoWVQprlewUNYq5TVoRZZFZw19zr2pWf04oG_EzWzdHytKdmOsyUcHwGMaufePP
 UkHNd9g7RaO1KLf0GXygmcVUZkj3Ma1ADLtOI3p0puYgQt7JmHZ5P_6DaxUPtBnURXmYxzGBHi6u
 bTlkgN1awtXKsCfgEvQFD8oYU.JLl3gbsufUhnpBCRXsgV4dFOnljy1R49PQBLdmBh8bOUY2cdaa
 ECzIKoVFLSXGoBDfJHhwsCqiEtzhR.j_M4BCDBeP.TG9c3nqaF4j.OCQofRpYd_3N1y9Azouqot_
 KASF44FLIRuOoj38bJu4vLrWN25oMElXTNkK0jLCbcb0c45n7k9pg2V3Ns6zhE3QeHjekqp.MTgK
 c52yF7.GF4BCV4WyWU4DOT.giPUaMs92XHVyCNo.tk5cJg2cYK2jdkt2tL_TKi5TaEq9NML3zC6M
 23Eo3qxVLclIwFqOpoVqlDYbe.Ig3ElRqMjk3iynyw9_3zsckyo9OycHi1QJIGpWuFlDDaLZ3yw6
 a9xI_sru1tGPKbg.r_.aYCx6JM7DW5E0L20W4dnfR8PbWBC5HMsjkeOctLhgXc9LAhhU5gec8D35
 cl7ITccOEypLjg5CT0KgY8Z510db2k4Cl_oo3.rQYZGabGY6NJoxrl1Piof94b_.5si9HRF5B0yb
 cUYPXEvS2ZSwLfc8YX3DbchQkCX72KoSpeUG9zzrNnJdP4fROjSfvzegpBEQPu7m28pQurKKfby.
 s60jXIPJzkSgzsRKcNkyq8vNV5j5R1mueSIYbf2PF8XmxUtVnMexCtnwxMIusOI69WSs5oeZTKDd
 dENSF6Xh28LYc.3mDtlS3Kbfgjiliihfq6PtZw3_fhe4YdneQz1WvkDKXx_tO0rKQAtLqp2L8juo
 r6OPT3Syoe.HF4G4dp3SBQ0JGaB0w1F..9d4Gfz5yn9jqxsFMZosNReg8.LjqaZKR_CRt9wl08uN
 rYp2jow41mVFj4XAt9Ono4iPTt02KSZihHDf8.e9clZ66sl9u16Dwj22JdaNKmLny3clomIB6DqP
 pEfbKRgXEGF2uN30B09ikat2l9dC9mmEqcx9I66n3EOr9MV54CmVKMn_TQ0rWE_pymdm4HkXoLBO
 tvHQUQbMoym_ZzLVNVzA9C04vt.672dktztKCpN7MT4TePzSeViml3XmTuDRhRh75pdb6
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.sg3.yahoo.com with HTTP; Thu, 13 Feb 2020 12:21:41 +0000
Date: Thu, 13 Feb 2020 12:21:35 +0000 (UTC)
From: Muniswamy Setty <muniswamy_setty@yahoo.co.in>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <956916899.2180940.1581596495696@mail.yahoo.com>
Subject: Need inputs on PLDM vs ipmi
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_2180939_395512291.1581596495695"
References: <956916899.2180940.1581596495696.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YahooMailAndroidMobile YMobile/1.0
 (com.yahoo.mobile.client.android.mail/6.3.3; Android/7.1.2; N2G47H; santoni;
 Xiaomi; Redmi 4; 4.97; 1280x720; )
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:41 +1100
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
Reply-To: "muniswamy_setty@yahoo.co.in" <muniswamy_setty@yahoo.co.in>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_2180939_395512291.1581596495695
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi All,=C2=A0=C2=A0 =C2=A0 Wanted to know, the specific shortcomings in IPM=
I vs PLDM?=C2=A0If my underlying channel is going to remain SMBus, what adv=
antage would I get from moving from ipmi to PLDM?=C2=A0Regards,Mumi

Sent from Yahoo Mail on Android
------=_Part_2180939_395512291.1581596495695
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,&nbsp;<div id="yMail_cursorElementTracker_1581596117926">&nbsp; &nbsp; Wanted to know, the specific shortcomings in IPMI vs PLDM?&nbsp;</div><div id="yMail_cursorElementTracker_1581596333286">If my underlying channel is going to remain SMBus, what advantage would I get from moving from ipmi to PLDM?&nbsp;</div><div id="yMail_cursorElementTracker_1581596467007">Regards,</div><div id="yMail_cursorElementTracker_1581596473341">Mumi<br><br><div id="ymail_android_signature"><a id="ymail_android_signature_link" href="https://go.onelink.me/107872968?pid=InProduct&amp;c=Global_Internal_YGrowth_AndroidEmailSig__AndroidUsers&amp;af_wl=ym&amp;af_sub1=Internal&amp;af_sub2=Global_YGrowth&amp;af_sub3=EmailSignature">Sent from Yahoo Mail on Android</a></div></div>
------=_Part_2180939_395512291.1581596495695--
