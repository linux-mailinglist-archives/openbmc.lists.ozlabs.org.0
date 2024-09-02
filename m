Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A23967D72
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 03:40:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wxs022Yxnz3cJj
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2024 11:40:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725241230;
	cv=none; b=SltC6utLTyhJlsnr6x5TTUkiZTyHiI2HDaHELJzQh10bP6c24W2ywZZufglEcIyfy8xxmmPQPI8sLaO9rBk3uhkV+shecpNyYevt5yBZCEWOk2n3ttcZeSA2UGNLUh7+3/earofqs4oaRCO4QdpieZ8MaPdEq3i2XUNDq9AdE35ByBh1FybYwn/aBNhxVSRMMcPkRghpqae+sIcaiezfnKOK/5ADMtyoXAyPcWDfyGmM3ZYJ+UNRYl+zZS897+CXhvpL9gq4Lg9bq5bDVRFdjkee2omqBJ3GdOOJRTjk+SDcMvrvSc6Scmf7w1tAZllEFjActPmpKWcUnKT2vd5nhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725241230; c=relaxed/relaxed;
	bh=Sr988LJMmSpwpaTQFZmYXmsxQcIC/Gf+0EbgmPQgJUM=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=PSJjt2pJDa+jKZSrhS0wUZcZpDPIC6CZhrODPD2UQ0TMYmlVSKtL+zu03CQmngbWfyKLXNvGswkt/zwGCexWOyA58IKkI95dzkWMDHzEoF+fbaWZAb+SuqpgP7OPOdI6HfK+6a34xVY0IaTi+mne5BkQ2zirbxCp2r/wENllJ7UlhgBq+0Rd1VYxsLTmTkH85Y1nOSnNRNFELbWBOQ/yGjg3fDkmWOeu7PrGtRyS+F+A6p+SEzaAjLPNkQE7s6Y4mlLKGDY9cjpvmQTvTaOtpu3+3P7sZgSpCIRO4lSoSyxXPwduwBoQuJuUUJkqH97Ko7pMFU78o5oEJJaqihAnSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UTx9PDjM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UTx9PDjM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=warp5tw@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wxrzx3wS1z2xdV
	for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2024 11:40:28 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a866cea40c4so418257366b.0
        for <openbmc@lists.ozlabs.org>; Sun, 01 Sep 2024 18:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725241221; x=1725846021; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sr988LJMmSpwpaTQFZmYXmsxQcIC/Gf+0EbgmPQgJUM=;
        b=UTx9PDjMm0n3nTQc9VywFFX04x4rBGh01EOv185Rd1b8dpwu2Xu8cnX+pFu63WDavo
         dc2sC71M8c5bvB1BgxgE3dMuvHpwyuUsQ3Nxv9XPAVWwnhTRVruJlS9u3VAL9dh64lMM
         U+G7DHODPBa/UbMIXLKGbuhE7Kl2aVrJzHCDY0AXK580YxOHo2/BDZOJ2pdPMagM/CBc
         wXqO37KtdAN9mXzc6WYkPT8euESLp9VTqkt8AnYsLjk4T/l/ZHax9o6mHOwjuKBTaWd7
         g64/W3EyD3+cIXtpQgSJIIcw6EHtasKZfeievjRmvhvgnYseyKnR5Xq/jpkw/PnbQU8J
         Bb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725241221; x=1725846021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sr988LJMmSpwpaTQFZmYXmsxQcIC/Gf+0EbgmPQgJUM=;
        b=wInMsgHWwWyTafJC+qjYh5XyvGAjrFLNkT8C1XqpZOWEK9LkLvEWkpRJcREMIGFXpH
         eAqH1q+M8wX7bhjwI9aaYICpkVlkiNk93portkbYIVIn+CnTXQQaEpiJSvSFnabfdoZT
         YDGdOVZrONRdO8Ny5ghgcdDnAgpWJpTRjhdgHGUs0Btuxco9tC4Phowe5uKeUVgA3EBm
         2m2Jn/ShAdMGIuLpR7FuxC4//INZe34e0Yifv9sLVvQC23V1lSmamKrhI1AfbJR58G4v
         6+Sd45QHKhbBhUq2pnFr+tFrLcfEQJ91YxvpV8DM8xbxbWUP0kW/5s7dBZx3quv0Iocx
         VUcA==
X-Gm-Message-State: AOJu0YxWRJrtleRbORPC03pNw5DGtGBLNDnOcxGXHq26UoHjYuCtb8lG
	Te6b3TLy/S/kD4r7eRmU4iIK1/G24sSFSolrbpGFk7sxteXcFTZD08ZojCyLmT4bqo3bkV0SILx
	+ugllKs4JHcStverePmEsblnv0w==
X-Google-Smtp-Source: AGHT+IEYKg+WMh+0uFy7RpZjEQ1/RRNRTGcffjDPaj1tT+igkzypbb176fWskj2te1H305jk3/x2p63RLrbhRgRKOtk=
X-Received: by 2002:a17:906:478a:b0:a86:97e5:8d4e with SMTP id
 a640c23a62f3a-a897f84d685mr999740966b.23.1725241220809; Sun, 01 Sep 2024
 18:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-6-kfting@nuvoton.com>
 <ZtIaofiTqyFwNXrO@smile.fi.intel.com>
In-Reply-To: <ZtIaofiTqyFwNXrO@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 2 Sep 2024 09:40:09 +0800
Message-ID: <CACD3sJbZ-Yy3PfPWisMSiPYCbztbi1+Q+=udMG8EjNvE+xA1mg@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, avifishman70@gmail.com, 
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, andi.shyti@kernel.org, 
	wsa@kernel.org, rand.sec96@gmail.com, wsa+renesas@sang-engineering.com, 
	tali.perry@nuvoton.com, avi.fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	kwliu@nuvoton.com, jjliu0@nuvoton.com, kfting@nuvoton.com
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy:

Thank you for your comments.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
8=E6=9C=8831=E6=97=A5 =E9=80=B1=E5=85=AD =E4=B8=8A=E5=8D=883:16=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Fri, Aug 30, 2024 at 11:46:38AM +0800, Tyrone Ting wrote:
> > Store the client address earlier since it's used in the i2c_recover_bus
> > logic flow.
>
> Here no explanation why it's now left-shifted by one bit.

The address is stored from bit 1 to bit 7 in the register for sending
the i2c address later.
I'll write some comments about the left-shifted by one bit behavior
above this modification in next patch set.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone
