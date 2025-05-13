Return-Path: <openbmc+bounces-43-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D514AB55DF
	for <lists+openbmc@lfdr.de>; Tue, 13 May 2025 15:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxcZB3n7mz2yZ6;
	Tue, 13 May 2025 23:21:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747142498;
	cv=none; b=nwjhGN05pfSGtEBXIHPtXXORS+khAkBwwRF1pw0Dbz+dDS1E8s0AaDdfy6qevp8H+iCvnJiW8elwfUoShtGMA7M0kEXbNBtJHEQbW9b7yjCk8RIPYxIGMSedoSMeiz2IjxhXm8PbReFI1G7jxQB5eNGM+K2CNhd6ZW8ubqeAhYWx14n33C26dizILk2ys7N+8TbqMeIHUOOyCSs4sE7q9QBBqWW/LEFcBGT6J2U1qkd9nGJE7RLfZG1hTyqsx+pD/9vUGUc7ZbM3Sgqg2lFHJ1u+OYMPv6aTR7gvzjuuMlBpjk5rvewtiAnDVo9q03zYvCg0/3019/B6xHJ+Aat9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747142498; c=relaxed/relaxed;
	bh=bgrCMyre345POPFqG4fkDW/9a7O+u8KmnKzG5fv0xWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYC6HJMEFeYwiQh7BGqiJBI/2DEp9THmz1R83ceJV3y89F0uZw2RAXQSoAi9KscCemHdZ0DTUOtjL6nHuQpK0Gqk9r5mx+nWJTCtzu2/COnUYfKlSVtY086ugHriQ9ScAci52q+GSVl137vTm4E/Cw4n/Naz8NzLjMyAimdtgHcKxKaVeihJrl6ygqJo+KqxSWWc6p2rqKDkHtwGKUUvj3wwdkmCkGFEGTxwsIhm7xTQk2WjG7zR3+ZuQeBmDAgzcrRo0T7nx4o6KhP4OaawyNeK8cN8dp5iopsulU6y36qt2mIgJ0ZJp78zNLpNIY2yb8tMtwC6Mge3+dJeRsyf8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WYUl7gRM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WYUl7gRM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92a; helo=mail-ua1-x92a.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxcZ91Vftz2xRt
	for <openbmc@lists.ozlabs.org>; Tue, 13 May 2025 23:21:36 +1000 (AEST)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-878440ee153so1526802241.1
        for <openbmc@lists.ozlabs.org>; Tue, 13 May 2025 06:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747142493; x=1747747293; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgrCMyre345POPFqG4fkDW/9a7O+u8KmnKzG5fv0xWw=;
        b=WYUl7gRMucmzypjTw23Dq39sqraR8I0Ac3Kyr/zSovZ8UX3dlNDCZwX0VLfa/T11pn
         UOtRq7jB5Uij12e0gSRIg6oYlC74mPk8rn8t9GRDHhZLo9QYrwj5f8NdHqT/1DfKDQud
         53wRFhqOuV2gBqSDyZqi/jb6HD1sYkmMlUeiztXvln8jU3bqotoN+FEITySlYHXtRrWE
         dB7KkTgMpwQItNJRaP636ppz1D7C064ycrCzgpU01ZVyZn5/8eh+qy77ahbpt7mvhoer
         prvs/V29js/hheRaVQOyksWQmD2Z0Z6HgXDfH/zG2j8ED74LDiDsaw4XZnB6lgxhq5Bg
         NXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142493; x=1747747293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgrCMyre345POPFqG4fkDW/9a7O+u8KmnKzG5fv0xWw=;
        b=vPpaay3sVDBoq+F5QQu6VC8VOV95XJAQ3ofOW6hr6zj34R3jZhmvrbjcb6SevkClRN
         JR9dea+v2f4cI03Y/IEV67GtzyUafvKtonx5ii2iOs9anEs7MccetDWG7YUA6s9yrU0v
         gthiv8qT32ec12Y3AjOzZh6r6eMN7L2lTsfB4B8QG9JVXn2DEjTnwF5cdIQLtJXG168+
         YxpsNwk+NFc8/CpKBEl+WzYTrW82lc4fqlyu9AV/D4V2IuuqJl5DXzwBsjw+IAJlub4B
         8iLl2ix3OafNsRQBgrHCAJ5BFsuFDQmV49GDCCpIUFV9h1TqrTOKEoxg2h/6z/WopPol
         7fog==
X-Gm-Message-State: AOJu0YxvVy4gv1PuIHVEKQszADaAghxn+94NkAvLJy2mgwttdStDs7TX
	DStu9rMNG+cEZODozGchCJuW/oxg5ikiDuxI6rFtnGHVIwK+9Nw6DRjPGQVoWhxMRrqLAzhwBFI
	cU8wadI5nw09NFk3nD7zkKK4EW+E=
X-Gm-Gg: ASbGncsW2El9LOEF2G4lFJKmTnwLZtWWgJxCUaJ1gjCEjm5zc6v0IbDMK1C7662syiE
	e9m+6jZKCcIE2vIBo7VwBfQsmYxbBbLFL/hp1ZKeB+CROQLXmzYCCAtIDINZM5ufhpv7p6pVjul
	g1SceIuK1qDTaYRaxgMFFtV1EgdYr4Rl9G3A==
X-Google-Smtp-Source: AGHT+IE8fQqQXuLQG7TKixiPqOnrYiW2dQN3tFVo2np4isT2qMEzAeQcetxG7dgCvRfZJGDnJ+/mNtH4W7DqIncp1jA=
X-Received: by 2002:a05:6102:4bc7:b0:4c2:20d6:c6c3 with SMTP id
 ada2fe7eead31-4deed33f431mr13229869137.10.1747142493463; Tue, 13 May 2025
 06:21:33 -0700 (PDT)
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
References: <SEYPR04MB77557AB29179C6CA6355DBA3F197A@SEYPR04MB7755.apcprd04.prod.outlook.com>
In-Reply-To: <SEYPR04MB77557AB29179C6CA6355DBA3F197A@SEYPR04MB7755.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, 13 May 2025 08:21:11 -0500
X-Gm-Features: AX0GCFvmq5hUKW4gqflRDn-WQdmwRLkuCexEXv4PPFYtiN2z4wUUlUSQup9ndUU
Message-ID: <CALLMt=oWwYgDJhdCLY2K+ZYxwXGUR58x0KEwAEJ_jhMwDoGZrw@mail.gmail.com>
Subject: Re: Quantas CCLA Schedule A update 20250512
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	=?UTF-8?B?U3Rld2FyZCBTaGloICjlj7LlgYnoj68p?= <Steward.Shih@quantatw.com>, 
	=?UTF-8?B?TWFydGluIFBlbmcgKOW9reayu+asvSk=?= <Martin.Peng@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 12, 2025 at 2:10=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE)
<Litzung.Chen@quantatw.com> wrote:
>
> Hi team,
> Please find the attached file for updated Schedule A of CCLA from Quanta.

Thanks for keeping your CLA updated. I've uploaded it to the project's
google drive.

>
>

