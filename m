Return-Path: <openbmc+bounces-761-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA67BE8A0E
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 14:44:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp4Jh0Jdlz3cYx;
	Fri, 17 Oct 2025 23:44:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::930"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760705059;
	cv=none; b=M/Q2DF4CMJg1KNGYzbCp4A3vfiYja3A1tCL0aSs+wqyy8zs7AGADTSnldny4LriU/Wj0TnYnvMwVdFithQTiRLjMl3NtJx4z3kQQ2xgtFb6P4/0HXZwnd5b4ZOngeyUIvRXwr5Y92qSo5CSVq/SaCtVfcAOy0F0nzo9uTds59a9gCyWS7iwpbuAwHR/zHviKLZ5nJGR5DADbMYvuDkWuCyRUl4m0zCmJsdHF40NCQUu027o+7GNsMlZ3dS4ac8ndM2YecVrfAZB/SLwz8XeBt65ijbmwgPPlTvfGj/iFuo4D1sz/+p+8CqnGRdCA3bCOSr3HjA8F9y3zwY1/BUSwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760705059; c=relaxed/relaxed;
	bh=r2I/Gj7yndYalWGSfEn4KvjH9DhUA+r4jNNJ6r8pGfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ma7DoivBtEv3BkcChvIehwDCl2GgJ361xe5anjyLmwqPHPOzSpE1LOniBH4NewqFSu4FX0WJrBd2Dfj1DhwYZP+JzQP4YKdZHCmmetd0s/tJ4sYcGTZTHrA9J/nMBOOdsVy4HF0Fd3MUiJ9k1FEqEgOd9x+a/9moRAQYo0H0fUYg7NFHQlKtMCNFGfQ8yqXVHTKQU/SAA+RyZuCt4uqAzhvXT/+kyBOvawu2BI3VZML+FYD5USEIbo9VZvA04EoH0+weleJ7iAftXV1iFr+SMh7JvJtjvzCNPXjgFLuMecwGO4VfOCz2ELLGtV/9ibeTJ2FGwCaTawUlLUQldrJpRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CjfjgQx2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::930; helo=mail-ua1-x930.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CjfjgQx2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::930; helo=mail-ua1-x930.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp4Jf6rB7z3cYN
	for <openbmc@lists.ozlabs.org>; Fri, 17 Oct 2025 23:44:18 +1100 (AEDT)
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-932bb8636f8so444958241.2
        for <openbmc@lists.ozlabs.org>; Fri, 17 Oct 2025 05:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705056; x=1761309856; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2I/Gj7yndYalWGSfEn4KvjH9DhUA+r4jNNJ6r8pGfQ=;
        b=CjfjgQx2L+2Er+8cg+RxCZ24IyJz9lom6+DjMgxPw8d9ETPaDbadVIkwhVV0hgA4Yl
         hBdObyYzILiKD7m/wkqwYw/d6uVemxbdN4HYtkBKw5B9bvFIYB/ijvj3NzIb+E662Mqn
         s6FxnLD4L6R/tKKhiWZ46F2TGeIO7PbVRq+gNmJSY2J9pXWlQfILBYxw1YKpgY2RnrfL
         80lK2XJFrNzQjNzcnnSAMIkRm+sQGPJsivUh59TJkTqWslpC8TX4RwKy87ZLcAPZcYQQ
         Em4zygq7YvRWcP/z0CWqqZ/WFtypbhORtkwAkvzqkDXZbN1Zc+QgLHHPtjChIWM36AGf
         kWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705056; x=1761309856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2I/Gj7yndYalWGSfEn4KvjH9DhUA+r4jNNJ6r8pGfQ=;
        b=Dtw/HtxpHQIRhvj7JI9owzclO6Kx86MpHi2hebURO0oh1gysF09DycHeCk/0My8EDq
         iMvEgfAAY+772RjPJzVxnUKb6J76OTyssqXIJCfEQz7ch5DzYimDurxLBVWJ+FXuGK9f
         hgX4xgp4KcC5vpNnUXA4IyH/AI4Z8oRffpxn5G4KpyXZKF90ipncVvs2GBzYagBzk2MO
         VQYK2UdnK1Zofe6AN7ty9pq/kjiVqdP4VdGpY3SldEWG0S4bRvj7B/mf51ohI/SRDOxi
         gzHqRkBXkPhBaL4RUSScMw46vGu8u6wBVZw9NSjKkWYXoqlTa7eCT7L4OySj6ZV2sPgx
         JiqA==
X-Gm-Message-State: AOJu0Yz9vg+9ymjSAUW3xFiU7EXK3EL2QPIsAVQAGSI+jxgG595X1Y+u
	Sh75IbcraGOJYMlCakSYGHqDOr+x/fZ55lxD84uqejyqHBvpwNG0Kgm/KjhFDXeKA+k9h/XmlzR
	pu/qlS/+LJgtz8DXFfNF8+Cdiq+n4QJF7Cw==
X-Gm-Gg: ASbGncsRWStWh5j3AabNqhIGICuytShjs+LQiBL/34jGDGhe5JUfEBOi0blBhlvc3si
	3UVJF51b/RwBOrQtA4FEC41VWC1HxVB9x192LKzOu500tQRX8Jc1RV4mH7rgKWgtrxY6rfOGz6+
	PBxCXrF8EgtICcm5nCm3yLolEe50hehqhhWBU7GgO1N/F9X94nHjOKhzrvI1vHNNWdE2+vtXO3S
	g9aWHg1asxz0PdgFt4EGAnjS233YU2fXr0o+59zskNMPXXV7WU5xRBdwUXkT35EZxWM3Mo=
X-Google-Smtp-Source: AGHT+IGGUORxpiBiWV+iIJR1EGjw86Cv9rIuuzoJ2b6exFK8m0u/fqEeVKvO1rgRgBp3E5/wOe9nTOelYldOvzDIiZs=
X-Received: by 2002:a05:6102:41a9:b0:51a:4916:c5f0 with SMTP id
 ada2fe7eead31-5d7dd6d63e7mr1568658137.32.1760705056061; Fri, 17 Oct 2025
 05:44:16 -0700 (PDT)
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
References: <TYZPR04MB5291728EE91DEAFBD3869B3194E9A@TYZPR04MB5291.apcprd04.prod.outlook.com>
In-Reply-To: <TYZPR04MB5291728EE91DEAFBD3869B3194E9A@TYZPR04MB5291.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Fri, 17 Oct 2025 07:43:59 -0500
X-Gm-Features: AS18NWBQ5LlUwt1w4eIVP9BkAPewdB5g_nC_aTJ-tB3tsPqeNUpfJuOyiZXm9vs
Message-ID: <CALLMt=o5n5w=4qecOQ8q5h+3Xg4E5MC7Zvt1K=11aGGMq0BFiA@mail.gmail.com>
Subject: Re: Wiwynn Schedule A Update 2025-10-16
To: "Jacky Hung/WYHQ/Wiwynn" <JACKY_HUNG@wiwynn.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"Aldofo Lin/WYHQ/Wiwynn" <ALDOFO_LIN@wiwynn.com>, "Evan YZ Wu/WYHQ/Wiwynn" <Evan_YZ_Wu@wiwynn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 16, 2025 at 5:33=E2=80=AFPM Jacky Hung/WYHQ/Wiwynn
<JACKY_HUNG@wiwynn.com> wrote:
>
> Hi openbmc team,
>
> Please refer to the attached file for Schedule A Update of CCLA from Wiwy=
nn.

Thanks for keeping your CLA updated. The new document has been
uploaded to the projects google drive.

Andrew

