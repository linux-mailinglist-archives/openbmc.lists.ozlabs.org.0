Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 375308C9787
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2024 02:11:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lMgnZfHh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VjHpH5Sd0z3dJV
	for <lists+openbmc@lfdr.de>; Mon, 20 May 2024 10:03:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lMgnZfHh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=kasraamani80@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VhLGq2fxkz3bsR
	for <openbmc@lists.ozlabs.org>; Sat, 18 May 2024 20:51:13 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a59a5f81af4so534695066b.3
        for <openbmc@lists.ozlabs.org>; Sat, 18 May 2024 03:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716029463; x=1716634263; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=17bPjKWpPPpgTDgnvMTwceJRQmHjDPZVmeEtuWcDTOk=;
        b=lMgnZfHhO/aOuLhXlkEZ/VnqovlM+lsRAeqSK7YB29cDf1GdCh3gzKhRpjU3uMYVty
         rXRNXzvaYj20blElNkpTYYr7LoFQuTzbbiJQMHd5I88Y8aELs9+Uq+AUgEOoRU951gPm
         Xu1Sguc9lBaxS40wTFZ4ZS9IWLk8gBevdP1NzlTWLT70POL5tJRxPHp/r1m8ccVJ2N/+
         ZoUcFUEzr0TYoOtuU/d+sSSyCVxt+0c26RftnF+bmiySZX/28STlcoLbMrVbS7dl5h2A
         AxxNJ/k61cQlb3useNNk1X7LQ0bileSqm8PXMuN63Ko4JswWN7VnpXAO8SFVXdmcIZmi
         g6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716029463; x=1716634263;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17bPjKWpPPpgTDgnvMTwceJRQmHjDPZVmeEtuWcDTOk=;
        b=Q1RqtK264MWe1LJ8J6Ouo2HCZNmCbs/C4t7GgJ1LxbK1TQxA/fiBSbrrgO6EqcuINo
         tKYWaBYDd6Xuh1N5NVTpWVuyGojLtZIT8WmUuqQlk8JnAU9EDsGczSa/dPsFNd/EUMiG
         ZqmTyd8DnAJu9nIzjIVNIJFBdL8JqEVIcoKg3AjSBRrVEebBnjmKv54peSjB5ftFrz6t
         ezeiPBF5Ze7z2yKM6vXLYxaIhzSvGnnm1QALObTZxqzaWv4EipZBSpVlS5VrrMJLLBMr
         erq5w35XsRTDKmcTmhSmJ9vTfkQv9sNNHax4oCKJDpD3GjwkmiVxr2bhIWTAAdR90EVP
         r/9Q==
X-Gm-Message-State: AOJu0YxbxGFHTpLK0h+KdlnJlI37DSRRmCIHBm2zAWPS1BFi6V9t4lf7
	QL1VGNffajNTxlhd7I9J+oWqLcDTj3IAFw5jc3OH6nD+Oo+aQF1053tASZujQecAPbg5BWkxE57
	uX+5OF9XS+LR3GMkPYP7+PQwUpEb8AcMxI1Y=
X-Google-Smtp-Source: AGHT+IEARThVi6P30sF/tW613sc/al4MAsB6cqWuGfFN/NlwPnA0BTvhBC67bvVBc2HXRNBDxgtT+nCjoP3OQRpTSgE=
X-Received: by 2002:a17:907:986:b0:a5a:5c5:a9f7 with SMTP id
 a640c23a62f3a-a5a2d55a4bemr1995588366b.8.1716029462494; Sat, 18 May 2024
 03:51:02 -0700 (PDT)
MIME-Version: 1.0
From: Kasra Amani <kasraamani80@gmail.com>
Date: Sat, 18 May 2024 14:20:50 +0330
Message-ID: <CA+_cdqZ+ifXb1MMi3HvSrOi_xdoWMtSYzm2C+-Jruw2ou5xX5Q@mail.gmail.com>
Subject: SDBUSPLUS in OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008947a50618b83e91"
X-Mailman-Approved-At: Mon, 20 May 2024 10:02:54 +1000
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

--0000000000008947a50618b83e91
Content-Type: text/plain; charset="UTF-8"

Dear OBMC Dev Team,

I am trying to create a D-BUS service for an evb-ast2600 build and have
written a server for it which works fine on my local intel ubuntu machine.
I have been trying to deploy it on my image but have had no luck. What I
wanted to ask is does a workflow guide exist on how sdbusplus can be used
to create new D-BUS services for OpenBMC? and how it can be done through
bitbake.

Sincerely,
Kasra

--0000000000008947a50618b83e91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear OBMC Dev Team,<div><br></div><div>I am trying to crea=
te a D-BUS service for an evb-ast2600 build and have written a server for i=
t which works fine on my local intel ubuntu machine. I have been trying to =
deploy it on my image but have had no luck. What I wanted to ask is does a =
workflow guide exist on how sdbusplus=C2=A0can be used to create new D-BUS =
services for OpenBMC? and how it can be done through bitbake.</div><div><br=
></div><div>Sincerely,</div><div>Kasra</div></div>

--0000000000008947a50618b83e91--
