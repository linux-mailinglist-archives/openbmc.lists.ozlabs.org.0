Return-Path: <openbmc+bounces-787-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A65BFBD74
	for <lists+openbmc@lfdr.de>; Wed, 22 Oct 2025 14:27:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs7jM2T9Jz2yFJ;
	Wed, 22 Oct 2025 23:27:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::e2f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761136071;
	cv=none; b=m87x13ggSi1rqy5b8voLe38WexYeDZKQxeSr1fj7q7CqQNIen3nBLJdIB+1o8INqSfnGTeeTIsEkUvYgl34ylrqyCBN0jwzNthoheyJT2tGFjgBoVxxsE/t8eHgNRyt4f+ZL0TjVz6B64k5IHinrwTCU7qcLhrzONXiKbVHlZgiw6ufO1doOP6mnF/SRHec/zgL63fWWN4pCRR8gT9qGsRriFLvcaQSPfVFA5Yw9+hU9eJsJW9DsqvS2+FJ7WeaO6sHf5jwkvWikIL1+4s6G/K2yJOeDniQRvpZsp9P+0XcJZ/NvCq7VQ0V8tGYUN4APaukEA8Fx5rbXm5G8yV1P7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761136071; c=relaxed/relaxed;
	bh=ch/lFuMCn/1VhWWacZ0z8Q1b8f/+vmD7Shxs/pwFOOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohGFLr05D7/qhhqKuSxk4qk7Grv93Mq3aFn2TGK2JvQfbCuSDg01wjISRUPlLuAr+kgmZKUz2AWUNR3zBOD90DWHig4LzArhfa1dNnCfupsUs+pZYeDoJIhXYnLYf+JAuu9Hg/ViT2sIM8cIwjUMwb25m6DwEZwzuGPgF3K3MX4C6SqxAD94UqNQdbY9XA1hX8wwIPiehOmANMkpYC5dHOdWfuHj5hsAFdSaGVBjGFWZWAYdPGfHkxFnXKIoJUjb9S/0etIcvggTVAHCXpVkaWFmbnUalyLRS3z+AHSnquNRGne7ua8niPkBX4JmuQYLnP/4n3nYDAlKURnQhnEhyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFPq87gn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IFPq87gn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs7jK5jS9z2xxS
	for <openbmc@lists.ozlabs.org>; Wed, 22 Oct 2025 23:27:48 +1100 (AEDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-5db1e29eed0so317575137.0
        for <openbmc@lists.ozlabs.org>; Wed, 22 Oct 2025 05:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761136066; x=1761740866; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch/lFuMCn/1VhWWacZ0z8Q1b8f/+vmD7Shxs/pwFOOE=;
        b=IFPq87gnNT/9KSpZsEaK6cjJiOkolbM02cJkbZcHa2H4+Yowi16MeDEiu0sLSIYi70
         rJlCNhZAUHtleQwaTU/GyPdIOPdsAIVjDyRvkpTC2qT6MC3oqMt8faPXO0u5rlrwRv/M
         x/WWrGWv9Dn9NPIwmWmaYnPwaZhzOlgC6+d8Qy5+SM2WSK6WcpDOxEEauEvK7xIBwtbF
         7cXA31uUv4FXqZ7V0v4MwUdg2sBP9JtsYx0SPCgGyyqojpSklsHgPDbpNMBuWZqtY3TH
         x+AN72E4BxVbd+DB4qEuklSNNqx+eLhjmSRn5jUH2dkpNomMvSqCZVas5ALY4NvCwnRP
         nmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761136066; x=1761740866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ch/lFuMCn/1VhWWacZ0z8Q1b8f/+vmD7Shxs/pwFOOE=;
        b=SzoFkkLV9IGloZQBagyVaNQX+Dx6H/Kp7Ot6lOyxFvsPEmtW2s41Up/nOqyP/eYCsi
         g0DR4n1B0N2rxayLYM3Q5Rj7K/A4x27mziDUpXzvqKOT/Ujcm4i5Ookh73WK/9ryp7Tc
         o01UkNr1Veo2hbezNvlOROV1SjHg2cqngL+jMu9h6jNkISaDLJ9Rez0ZqFAhihXRWxLI
         /Sx2iGGOqyyU7NY68cUGPRZQDMtNFvetlHFvkZvu4OmPdySxKV6+/mWuxo+OQCEYW7pR
         7mkfgIWHMRZfLMN0NC8jIinJ4tg4XkrJsH7IMcpn/trBVSX5MlRrbFMhWkRZt0x4/WYu
         yKNw==
X-Gm-Message-State: AOJu0YxR0YUTxFpNfXwK4zt8Dtz82TJy68ry/4g3xZUOJHaiLNO0sybT
	lrLA6X/Nx9fLZTnplK7YfyE58u6mbuLEzIlO3Jv08nsFcQaLTlM0qjjaKrQlC6Igw88NaGpvkmN
	M1NpH0pPtvkunE7PfU0YCFQ5q2LE6De8=
X-Gm-Gg: ASbGnct/g2b0MnPPtiIAr+WpwK4ZwV4Zb39HcH6xyZ18Wg7xMt5IAeOFUC79ZglocPC
	92lisTo9IYqF3ncjvkGE92Ou/5WwdissGRQIfbMMTU+GET7h9ZFFQkQroIuLMG54NzV1JyH7GHB
	/cTCiD9T+rvLVjDf69UR1M5wo2r0rwGqrmuGns1fOLGfmRv3gy7wlZuAi6CykzVEU6A6JlnhgDL
	tp2seKThO8is8TTTGDPa29dkRPmS/Zk6nZ9KXVNAbIHF7CP2jFB3VHzC6vH4/p3t/m/FpTYGRc2
	6ynV+JClzeFtum2h9Go=
X-Google-Smtp-Source: AGHT+IFgKS3JOvR6P53s/UDPesgcVyov34sM//X9nzXaBKDNhFH3f1EidRDE9wpcmWYUnNpBIOtVVJPt9BO1pj/mFvM=
X-Received: by 2002:a05:6102:ccb:b0:5db:2301:a9fb with SMTP id
 ada2fe7eead31-5db2301ac31mr345429137.33.1761136065683; Wed, 22 Oct 2025
 05:27:45 -0700 (PDT)
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
 <TY0PR04MB73524FA10F833221A4C2A51EF15CA@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352C16AEABDB768394727B2F135A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB7352537F1867EC8D7C71541FF1E4A@TY0PR04MB7352.apcprd04.prod.outlook.com>
 <TY0PR04MB735254690EB4CB7F14A65D7CF1F3A@TY0PR04MB7352.apcprd04.prod.outlook.com>
In-Reply-To: <TY0PR04MB735254690EB4CB7F14A65D7CF1F3A@TY0PR04MB7352.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 22 Oct 2025 07:27:29 -0500
X-Gm-Features: AS18NWAJsGV3QPh4ApCcku9zHeomkktgomIl2t6Ghge8TD9gcyMN95xKw7rUQfg
Message-ID: <CALLMt=rwLcazDuUK9hsGzZL+Eju2k0FAyrcYezvYAcqAGpJDaQ@mail.gmail.com>
Subject: Re: Quanta CCLA Schedule A update - 20251022
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?Q29zbW8gQ2hvdSAo5ZGo5qW35Z+5KQ==?= <Cosmo.Chou@quantatw.com>, 
	=?UTF-8?B?RnJhbmsgVHNhbyAo5pu56K296aiwKQ==?= <Frank.Tsao@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 22, 2025 at 1:50=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE)
<Litzung.Chen@quantatw.com> wrote:
>
> Hi team,
>
> Please find the attached file for updated Schedule A of CCLA from Quanta.

Thanks for keeping your company CLA updated. I've uploaded it to the
project google drive folder.

Andrew

