Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDBE199965
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 17:15:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sCZ46DXHzDqSc
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 02:15:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=venture@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=C5h8U0lI; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sCXd1yfWzDqpv
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 02:14:08 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id 139so13464536qkd.9
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 08:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=y7JJ7s+UjGJ0uSr85L+sDMz70pTzBs58TWYoX1YMHhE=;
 b=C5h8U0lIs5YmztrXTGv/jSw3FlIom9cxEuBGjAUF/K2Rs8SLia1SRuBkFhNN1Q/D4z
 ZRglKuWHdCevc0donq3B1fUYSK+07BSFgc5I1eQBy9qRPfC0l9mR7lXt27rHE/p2XiDD
 Jn4F7lsRj7+fbN9BVnkma311295VxQ6DGO6AFFLCincOHObkvgS9E3M37KnxixsLrWuS
 ShMZbJwVrzD9+IfNVAE6IFTSDvrZNkLGHW0eVLZFPC3NpyUDWkTC4wgaW+phv49a63U/
 QFCQigdTnDMNDcBBoAPcg+3OWoLyooRoYasEKJO5ELW7aTpWfa7A/w5NF97h+7efTNzm
 74yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y7JJ7s+UjGJ0uSr85L+sDMz70pTzBs58TWYoX1YMHhE=;
 b=oQ8l1KLNbgMHoN++MQumE9rmecAX+LgwtFlSGXH/W/til9IENHwrtoJ01ceCRXyeTJ
 5RAHd/8E7hoC5inTD0Kbk5y2/Y2LBnmCVHpgI+UI5snBRF0RJa9UY16drF1XXyt4+NAm
 XFjLBl6ERLku6vIiYBQPYPi3ft1eSqpr/pVTUfztTjJjXCOzPxnQ3oeFvn1STdR9+Q1l
 Vv121fw/06RCxFP2I5WeyXwqoRsa+zuLwOlJTFnXFRC630IUmXVUJeT18DuOC8Y4w/9F
 8wBZ7Lth8RToQ0qAN80P5svYVzO/UBUkLa1V50P6lpO5bKZL+cMjeqFtSoqsLE8YD0aD
 Q0Wg==
X-Gm-Message-State: ANhLgQ3iOACIcjJoCydbJyU9aA0LByIiYPclW9eC+vx1ffpST/ykMuXu
 wpGolsNFWcq3HqQuS3FeLhsmvpdsO0z+f5Wav2COOg==
X-Google-Smtp-Source: ADFU+vt6q+zImEqP/JmmbzZeP5hq1Ey8V2KVEqb3XKIQPDpYuwPYESPncL5Zdi+iRxNs6dFF9J1l8zLSumkeudd1UhA=
X-Received: by 2002:a37:a93:: with SMTP id 141mr5466580qkk.244.1585667644637; 
 Tue, 31 Mar 2020 08:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <HK2PR03MB4531ACE1FAC28A9C8DF6A2EADFC80@HK2PR03MB4531.apcprd03.prod.outlook.com>
In-Reply-To: <HK2PR03MB4531ACE1FAC28A9C8DF6A2EADFC80@HK2PR03MB4531.apcprd03.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 31 Mar 2020 08:13:53 -0700
Message-ID: <CAO=notyL+J0BGnW+-pnG-7ejY7-Dsn41jxQmhozNfGArNLnUdw@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: tools build fail
To: CS20 CTCchien <CTCCHIEN@nuvoton.com>
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
Cc: CS20 KWLiu <KWLIU@nuvoton.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 1:42 AM CS20 CTCchien <CTCCHIEN@nuvoton.com> wrote:
>
> Hi Patrick,
>
> I upload a commit for phosphor-ipmi-flash/tools, but Jenkins shows build =
fail.
> I add two more options for nuvoton pci device
> enable-nuvoton-p2a-vga and enable-nuvoton-p2a-mbox
> and I build with below three command sets on my PC
> and they all build successfully


Take a look at the output in Jenkins more specifically as it'll try to
format the code first - chances are this is what is failing.

>
> 1.
> ./bootstrap.sh
> ./configure --disable-build-bmc-blob-handler
> make
> sudo make install
>
> 2.
> ./bootstrap.sh
> ./configure --disable-build-bmc-blob-handler  --enable-nuvoton-p2a-mbox
> make
> sudo make install
>
> 3.
> ./bootstrap.sh
> ./configure --disable-build-bmc-blob-handler  --enable-nuvoton-p2a-vga
> make
> sudo make install
>
> so would you please help to solve this problem? I have no idea what's wro=
ng.
> Thanks a lot
>
> B.R.
> Medad
> ________________________________
> ________________________________
>  The privileged confidential information contained in this email is inten=
ded for use only by the addressees as indicated by the original sender of t=
his email. If you are not the addressee indicated in this email or are not =
responsible for delivery of the email to such a person, please kindly reply=
 to the sender indicating this fact and delete all copies of it from your c=
omputer and network server immediately. Your cooperation is highly apprecia=
ted. It is advised that any unauthorized use of confidential information of=
 Nuvoton is strictly prohibited; and any information in this email irreleva=
nt to the official business of Nuvoton shall be deemed as neither given nor=
 endorsed by Nuvoton.
