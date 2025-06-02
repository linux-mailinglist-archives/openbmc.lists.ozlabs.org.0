Return-Path: <openbmc+bounces-113-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD3ACBB3D
	for <lists+openbmc@lfdr.de>; Mon,  2 Jun 2025 20:50:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bB2wn1bBtz2ySQ;
	Tue,  3 Jun 2025 04:50:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::931"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748890249;
	cv=none; b=V5UPiLvQY8AxBDekYzwk58MLyBd9lrJ1CcOyIgRfX96fztP/es4vKKqyNmTC1PMzRsScgt4ESkXbbSIniPlRyc42kO7EGiaMIaonoGoPxfRyk61DeFQCrqarxYunyJPLHzzK2Q8qDFQwa/qykegKMrWfa02E7lXC3s6SoVspqCmk+rQB1/VVe7B/8Uj2ZswYiws5YSNgScJUoE35V1b7L4jE8uKyU125ALSkK9DVFOSIY+VxshMF9nuYB+CljSK3K1nnFSN1QCz2uFTOGGsaStDPmAkuyW2PMtpHZAjZeg4xWZ0gbDtIhmcvI7RpU8vTRB01VpFNv5+ceu8/itGY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748890249; c=relaxed/relaxed;
	bh=upUmw/avEfhwvV9+M4VDyxAcPAcPubGWzW6PUGo0RVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsdXrAcsGPI8MkVPtgWExeZYgFlMJy4PAQjG9B0Slkw2yd+rkGdDkhKETnRoTOhDnqxs/fJGXHQq4GyfkKreuOkiXcSslucOj9FVdu0OpzPD6TA3fApw5g3M6syxOjlEsPVBceTl5eKxfM5gLvSzy6dqZFDqvON3yDSqjnrh5oHaBQIQjzGkjWarnZjGJ5zU2QzcpSTmv6VwxkWmEJX8lsAOVEmz4v7KhLgjZ+wbcvraXQpZOd0+Ov2447EEOKfusG9rAGfN6OH5klTRFmz+weeSA79yL6PcvMu+GTz50nXVnaegTLFyZsoDp70Ecjh4zoIWUXAMueS9kmPnBG8SiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CpwYBCma; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CpwYBCma;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bB2wl1BKQz2xfB
	for <openbmc@lists.ozlabs.org>; Tue,  3 Jun 2025 04:50:45 +1000 (AEST)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-87de33ccdb4so1291105241.2
        for <openbmc@lists.ozlabs.org>; Mon, 02 Jun 2025 11:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748890243; x=1749495043; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upUmw/avEfhwvV9+M4VDyxAcPAcPubGWzW6PUGo0RVw=;
        b=CpwYBCmakp6BZVacUwHS106Ti+Og9IXg4dMePNslv1DGPkZzjqupuIK+6nRDusnYFE
         DTIJWdjgm0rtbBOBtguI90LSbHrEtGWCJXcnjampLp2KuBuXFBVIIdQz9JRywgtE70kL
         PBStZgV51Pzks5qy/FWfkcSbTztj9e3N71KG8kr678pfwh2srPDmVbEGE80evVO+7TRe
         /QhC7aafzXjY1yfubwgSarx12uv0Yb5g2xgYSq795wbUYPLaQcSKvieKGEcCLfDwx9Tl
         ipMJ1quLk5KWw9/ZgsFW27zf7gXnjo8Q8myDY7UjN/GK54x32Zn6Mr+xxeiyjvEmkqiR
         PD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748890243; x=1749495043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upUmw/avEfhwvV9+M4VDyxAcPAcPubGWzW6PUGo0RVw=;
        b=QQO2xzFhYd6ZiufIdxzaGpD30wJoZZ3OPVgnbfGa7y7Y7iqlG4S+Ux9VEav7iZL/oR
         gU86paUsbP8SY6caIALemwFZir9ebY7ACT9JB3j+C80RZsEPk8XxYjgEX4E6qbbLO+M0
         /FWbNprc7ReZlsIilSIhaoQf0LZzWT1pvXr+oI8PDrAMy+o72GcvAa1/2aiIMHb0B4d+
         qIibtZe3c77oTd8azx1PvLS8pOEH+nyPNI2oYP3jy5cFalc/tTHod5gKnThRJkGldFuH
         eODsDeQ78TW2DuoFldClW5Q+bh8yRzVQHkrQ0+9GaybgGUmi99yiFHTxKHQi7xvwv5E9
         vPPA==
X-Gm-Message-State: AOJu0Yzwq1ZrrT+BB02IYLj/0cpCUFevPsTn+LOYsW5MW2yzRzd7JDjy
	gFI+fEIuvCirOUHtKBFyb/ZkBbJiozVfOTl6+kkRKBf4qTujyv3HkS9YHVRxwgPr/+g8zw/dZV9
	qfqQpWJjgOfm3/sfmy03xUUAvHjjkUCw=
X-Gm-Gg: ASbGncvkbINbm/iUm7Ins7Dhk2UQtk86WOSaJ3QioDKK7D+7tVcvDsByFIBGMSnPWZV
	jy3DgqdndCIKqc2PNTDCd7I5rnbAIBcvwmNaUgo9W+7Hkadfv1gY6vd6e6koagF6bAebMt3eZ+8
	8eK2uCOEdTEs8Q5Bq4//VZppVqaGwjqs8DG72CEI7zJ7s=
X-Google-Smtp-Source: AGHT+IE0Vk5hHXILV+hZwxx6I+jmqxZSD+rbunts2PHpKNRkVJ96+Au4Pv1QbahmoSN/1qzTykxpvqhiyEF+8RnHL4I=
X-Received: by 2002:a05:6102:4b0a:b0:4e5:97e3:a97 with SMTP id
 ada2fe7eead31-4e6ece28a1emr11289210137.15.1748890243299; Mon, 02 Jun 2025
 11:50:43 -0700 (PDT)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <SEYPR04MB7755127F14678E6D3616B901F162A@SEYPR04MB7755.apcprd04.prod.outlook.com>
In-Reply-To: <SEYPR04MB7755127F14678E6D3616B901F162A@SEYPR04MB7755.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 2 Jun 2025 13:50:03 -0500
X-Gm-Features: AX0GCFtBXFwiJf47_pVKZ7ZeEcODsqFJsNxzQSJG5jsk2Pm74sX6uLwTQCogFnI
Message-ID: <CALLMt=p36MvZk68vGtwqSgDj0dxf6bOchvO0dZg7U9_AUtTPsQ@mail.gmail.com>
Subject: Re: Quantas CCLA Schedule A update 20250602
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?SmVycnkgTGluICjmnpflqIHlro8p?= <Jerry.Lin@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jun 2, 2025 at 3:50=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE)
<Litzung.Chen@quantatw.com> wrote:
>
> Hi team,
>
> Please find the attached file for updated Schedule A of CCLA from Quanta.
>

Thanks for keeping it up to date. I've uploaded it to the Quanta CLA direct=
ory.

>
>

