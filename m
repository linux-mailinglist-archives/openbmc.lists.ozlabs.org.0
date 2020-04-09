Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3ADB1A9399
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 08:48:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492Cbq4XTkzDr3p
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 16:48:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.co.in (client-ip=106.10.244.139;
 helo=sonic310-19.consmr.mail.sg3.yahoo.com;
 envelope-from=muniswamy_setty@yahoo.co.in; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=yahoo.co.in
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.co.in header.i=@yahoo.co.in header.a=rsa-sha256
 header.s=s2048 header.b=QMn5JmD+; dkim-atps=neutral
Received: from sonic310-19.consmr.mail.sg3.yahoo.com
 (sonic310-19.consmr.mail.sg3.yahoo.com [106.10.244.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yYXY6xd8zDr9W
 for <openbmc@lists.ozlabs.org>; Thu,  9 Apr 2020 18:02:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.in; s=s2048;
 t=1586419349; bh=N8ZztguiZ6ViatoDA241KbkjaWQ8bnaEYux6SoljSqY=;
 h=Date:From:To:Subject:References:From:Subject;
 b=QMn5JmD+s+MIdB4xNmnNLnG7oZSelOXED/LJ/mDoxpLTQp6G7hnvD+ztSl+zhqAVvNxttn3tM3f8gtvrD6hJAK6/r2Lxt0N+z+xQhS9S0stY5WyZr7RKWBPe/DqVrnucJDWpDxvh5Zn8yAj4VoO/Y4uAvC5IAdWWCm7CP67TuxIS4Fyh9oM9YUI4eLDwvYx5/XKc82efwm1DouuofJjw7beP6PQ+cW7U0+GiRWIwq1RjdpAJ3UptnNcEklT+k4rZ3jxLYJVx06j0vyP5J66jYVf2vwivKXwK6QFW8PxR4/56Rp+qFVtZuhNm6iB2YlCMvhOzFlh1jL3fznywhwD4kA==
X-YMail-OSG: mev7s3kVM1ldVCHg5s_YsueK4.20D.tYbEsqOlc8I2O9I6rG48zaBexZNqy1N5z
 ds2xJ2McfjlJ1JCkkCI7CMeElfEORNdtbrXa_JrnIrQsNWP7885.rvEV4NQlX.iHLMGSdBqikjcE
 ZILLkr.EPVheG3_977q1UaekSKwmOVTCO3gPjJRRLcubhBodhhqY25Mo79c1JkIuAoWVOPtMVD_W
 nnCs61qT5TLKe5NwXFf0giasnmdDL4F4Mu9w60b7te40LK0txATNJESZ3wazODv1xPX6.9fBqBxZ
 I62N_ZaAyhUznazVyOflrNg7lST9l.RRM.LtZFNvbaqsggDABBTSuXQtipP0mjvHKb2P7qCRiWar
 PyhTsNUDgw2Epac0rALm.ARZQ9fXbSbD9_9DTIBj6xWmLMq0rNtRdLDC4IMK8Y9vJ1PShfBKmqbg
 jhFI8xLDoW9L1R3fGLsGAWILd73Sr4bHgnfMzEjVNTdmWqhRiSdmVmVpDOHTVWjvosw6j6rLEXIZ
 LvNIlt.p2mHtxyqIFjjLFVZ6RhDragzx2v57g.gUCUK4LAY14VsNEnyHXGQ21BJF.oRogteOtqMB
 ebU66_X6U9Hl4faTc01.HLlMVcdXZ4e9A93uz5frMTGFrWySLSx0LQAQYkp6vcLdVfcPKQfL6B8H
 ReHw56h.TAK2WLd1.a0n9jFfvDrXP8UqVH0gX0ih711w46S0b.1fgJBJ6TR8plWF7pY7YDzzDi61
 p.ST0XDRiXhE_Iv4hlcUROso32mbLGIWLKzOyXIx9B.jAkdATgKY9A76TAAZszkBcqO3rWmsq1ri
 vc15IzLRAFQYjOHGBdOO5RDETH6haiLmi3GafRt2hUw5bYy6xwabSfCZWDNW1ZHd7dRRyyKDjDqg
 7RJuIDzhfbaNDV7Ljo16hjECc_PTR12uKhYYQbeUMoGd5OH01f04rp1ISRpj3g7o5dpWHmm6Nz9R
 DLSb5YzR7OrWrrHh0P8TREZnzsrFagq1svnX8druvCRIKXto1Zygd4hxaHglBRJpjEuk5IjS6gNE
 _HRG00S0i9Q9QaVYvVas4J6cnKdWvo240YvNNFEEbdddzZK8tesYf9v5.bZtvRWp1OvmJXG4dF9K
 x9YzZPx2deAH9Szf4q79JROoD7ZuVTYW46v.qywdqRgrFeWo5pwGHdn4biwIGizZ.vySmnjQnIPT
 KBHfhdTm38uXeyBGPcnDVpJzQz.cMxqOpLUkQ9O7vNtdoftc67D20NbvbyIXOlLUs.MEsgMIP_Ui
 hQiUTanWISCtKr2qHg17jdLopaex8GE4ApI30oH.FD8vDGp6cUlZk7xgO2pkt
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.sg3.yahoo.com with HTTP; Thu, 9 Apr 2020 08:02:29 +0000
Date: Thu, 9 Apr 2020 08:02:23 +0000 (UTC)
From: Muniswamy Setty <muniswamy_setty@yahoo.co.in>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <1489827237.1722456.1586419343847@mail.yahoo.com>
Subject: Any tool to list the PLDM header structure of a PLDM based firmware
 file
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_1722455_2048727526.1586419343846"
References: <1489827237.1722456.1586419343847.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15620 YMailNorrin Mozilla/5.0 (Windows NT 10.0;
 WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149
 Safari/537.36
X-Mailman-Approved-At: Wed, 15 Apr 2020 16:46:15 +1000
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

------=_Part_1722455_2048727526.1586419343846
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Team,=C2=A0 =C2=A0 Wanted to know are there any tools to view the PLDM h=
eader information in a readable format from a PLDM firmware update file?
-Regards,Muni
------=_Part_1722455_2048727526.1586419343846
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="yahoo-style-wrap" style="font-family:courier new, courier, monaco, monospace, sans-serif;font-size:13px;"><div dir="ltr" data-setdir="false">Hi Team,</div><div dir="ltr" data-setdir="false">&nbsp; &nbsp; Wanted to know are there any tools to view the PLDM header information in a readable format from a PLDM firmware update file?<br></div><div dir="ltr" data-setdir="false">-Regards,</div><div dir="ltr" data-setdir="false">Muni</div></div></body></html>
------=_Part_1722455_2048727526.1586419343846--
