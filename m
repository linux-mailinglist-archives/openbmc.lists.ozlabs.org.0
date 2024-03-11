Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A534878022
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 13:45:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j4xWw55m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ttc1R1zb2z2xYY
	for <lists+openbmc@lfdr.de>; Mon, 11 Mar 2024 23:44:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j4xWw55m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::31; helo=mail-oa1-x31.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ttc0v2nr2z3cR4
	for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 23:44:29 +1100 (AEDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-22187576d54so3335413fac.1
        for <openbmc@lists.ozlabs.org>; Mon, 11 Mar 2024 05:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710161063; x=1710765863; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtcUC05BS/Uo5AVOKo+gQuKzMHdNS5B/Yv78RUfibOU=;
        b=j4xWw55mUERr0F7UHORRwLH3T/8v8d5cqEGtXuKnA7aVYFwezFFQEAI+TIcGUQk5K5
         Ug0BAKZvcqMeJ/MRfvOTopjLjL1r1JGCJdVFdcgLMLYzss9KmvxsuTZiICahdLManK5W
         d0SC0/HBSTLt7Lw+6/ua+oMeGTxBAYuW2NVoHeQGH4CxRyatFkTFM8GnrSt5aab8Ak9a
         6LjQZtJ0PFzzN+58ZddiNDadiNLTxkapGcMgaNVeTa4IS57zTI0d0aKNb5zSlgq6iuN8
         E4Sc4CUrBPL3UGJOZhc5qxOzQ0k16rgwYuHNaTYkZaQxRUqyf41k4YPpGUnSG+0ijKnv
         CQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710161063; x=1710765863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtcUC05BS/Uo5AVOKo+gQuKzMHdNS5B/Yv78RUfibOU=;
        b=a8miVn1lLef65U1nNhJ2BBsCSSNAiI/T7UoP574nOimqECEWW+SFwmw43GivJvK6dc
         R1I1Lcl2M5dUNQuscobLO++PYZvDBKB6gcYxAIb4TX8lMNnNmXQrg4ExacjmCEftLSAM
         oaG/846G/uJ6g4sDKVTU8t9TeBBX+m6vLDQtjIwURQXq57Txn0vPwHjQ/vh5qYGkWTSh
         jeOP+s7QQOkBYjnB2mpcK60ZpCWC6O7qmvPA2bexyAGIsLd34ujaYIXLOI0hnKciCZef
         gl04qoJKAK+BiPflpxu3/6F8SLrHKpvZYI22uGVhqamJyBKgKmA9dtryCFKDbqK+jj4Q
         IPzw==
X-Gm-Message-State: AOJu0YylAbNTebeDNIhH4ILZJwOonbQeBELB/DjRCnCcrg623SxG70zx
	SRzTZ3O0bgMmfpxBEvzLbP4nYf/R5r57cMO92+sohnAIpDQv5BLnpKKuPBTm0gOdWTq2Rjy9sqq
	mLWFjr+4QRC6mAOVwsKScFxpn3Go=
X-Google-Smtp-Source: AGHT+IGb/RBFaVKSXuo/g7WMT6o4VSEsLQAj2ctOm9lYF8IhBcL0dTAsfSDeHReY+oxNIDyfOBaVCYgkA0Dmi7FcyXI=
X-Received: by 2002:a05:6871:31b3:b0:220:8b6c:80a5 with SMTP id
 lv51-20020a05687131b300b002208b6c80a5mr4558355oac.24.1710161063136; Mon, 11
 Mar 2024 05:44:23 -0700 (PDT)
MIME-Version: 1.0
References: <CH0P221MB0284AD4052B11B43CE47F558DF232@CH0P221MB0284.NAMP221.PROD.OUTLOOK.COM>
In-Reply-To: <CH0P221MB0284AD4052B11B43CE47F558DF232@CH0P221MB0284.NAMP221.PROD.OUTLOOK.COM>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 11 Mar 2024 18:14:07 +0530
Message-ID: <CALLMt=roJnF7Yx46x6cXxNx5o3bkC3qLtgDwwpQkRYKC1gJ+SQ@mail.gmail.com>
Subject: Re: OpenBMC CCLA Submission
To: Ed Pastelak <epastelak@tripleco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 5, 2024 at 4:13=E2=80=AFAM Ed Pastelak <epastelak@tripleco.com>=
 wrote:
>
> Hello,
>
>
>
> Please see the attached submittal.  Thank you.

Welcome to OpenBMC. Your CLA has been accepted.

Andrew
