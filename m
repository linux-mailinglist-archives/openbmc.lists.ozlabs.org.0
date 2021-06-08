Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1EB39EE79
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 08:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzfjS6gfhz3021
	for <lists+openbmc@lfdr.de>; Tue,  8 Jun 2021 16:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=B2qdvS1Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=B2qdvS1Y; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzfj651H0z2xZZ
 for <openbmc@lists.ozlabs.org>; Tue,  8 Jun 2021 16:00:09 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id k11so17507342qkk.1
 for <openbmc@lists.ozlabs.org>; Mon, 07 Jun 2021 23:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OkN03lRrkrF70PElm73O8ca/hU79CssARSrTENN2aR8=;
 b=B2qdvS1YIk99XnQUdsG95quYpklBm2OGc4P0wzSX2hbwfm3mkOPtxoH9yjeMBDQ5ki
 F+p7r3qmj6mb0yUAPtkerZrJRPnVpmJacavboOiDu9eMYlWFKy3+6nxXnTAJS1MUVzTN
 GG8TnDg7cSallk5MLR26T6RVKLm/TW1ilTiOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OkN03lRrkrF70PElm73O8ca/hU79CssARSrTENN2aR8=;
 b=YU4uoQ2bu4fHOM5QZXCOu2LcOfJY9srEXnHjVM8T5zHSpMOWSIhJu64imvoej5a1/w
 1Bz40KOOseiwRz0RFPjUI1ShidFljeqqfonkFGxjFQAURXnXAEbMXGfzCHC8T9f/SEI9
 gw7TyomXxfqKAKysmWmvYSAcNsJKzW0xlMAEJSYuJm0ugBxtgmXzXKgCI16R5TsPJGwH
 EEi909x6WgRPjv0JySfdUUOOYt8HoPb8atfgrDq1z99/SWyxVDfb7RL1CXbG/DJYMKo+
 hi3GzoVpvNq4qujYnMjPHkkhk9Ju41zXDra42skL+9gDGu71EneKM+fwFlrcXu7X6tFy
 ahLA==
X-Gm-Message-State: AOAM532O2wwnfOTOBmS9sLD3oKGuJ1TO0yQYrmvw+FlsCQKANLfb4iUy
 HZ9OwQIKgD4yiAtN0aGOQDr4oN/bwUIHKv2yswI=
X-Google-Smtp-Source: ABdhPJxRvq+pn5hZ4KBiTyTygSX36GimAnkePYnEs/KPd+bQP82C65L7Gkhjwee7TwXkkHTDFY0BLQX0q4+UaLqFNmo=
X-Received: by 2002:a37:b404:: with SMTP id d4mr8690805qkf.465.1623132004844; 
 Mon, 07 Jun 2021 23:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <dbe431da08674c61bcda091cec16b5fb@asrockrack.com>
 <5d74d92b8e2f47acab7da6a54f6c18ee@asrockrack.com>
 <fec2cbe8fd144a52915d971b4e7214bb@asrockrack.com>
 <58f7b059987f40b78ebdcdbd1db5d969@asrockrack.com>
 <8a3b99b118744df5a918b43e5520d35a@asrockrack.com>
 <CALVHhedqJhfKD+MNofiwnKBB7sGG1wRPV4gXTdW_h=8=6=4HKw@mail.gmail.com>
 <OF6DE94A96.B5787DB8-ON00258584.00525E62-00258584.0052E3DC@notes.na.collabserv.com>
 <OF796A58B2.9DA64EBD-ON00258585.003E519E-00258585.003F6F0E@notes.na.collabserv.com>
 <OF2B5AA3C5.40A65716-ON00258589.004350E5-00258589.00436A50@notes.na.collabserv.com>
 <OF5B0F1DD8.7358EE61-ON002586BE.004FB2E2-002586BE.0050DCF8@notes.na.collabserv.com>
 <7807e4794c844beda004d7059c74289c@asrockrack.com>
 <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>
In-Reply-To: <cb87a8f3a17f47e192ab5474a331807c@asrockrack.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Jun 2021 05:59:51 +0000
Message-ID: <CACPK8Xfi9FBjPyLdy45C=hy-e4wktLrTp3UmFhH59oaaz0yTYQ@mail.gmail.com>
Subject: Re: OPENBMC ASRock Rack
To: =?UTF-8?B?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?=
 <Jeff9_Chan@asrockrack.com>
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Bradley W Bishop <bradleyb@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 8 Jun 2021 at 02:01, Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRockR=
ack)
<Jeff9_Chan@asrockrack.com> wrote:
>
> Re-send

Please use plain text email when posting to the list. This is a good
rule to follow for all open source mailing lists.

>         I got below error when I try to push meta-asrockrack layer to ger=
rit.
>
>         Is that means my email is not listed in the list?
>
>
>
> To ssh://openbmc.gerrit/openbmc/openbmc
>
> ! [remote rejected]     HEAD -> refs/for/master (commit 1d9951c: not Sign=
ed-off-by author/committer/uploader in message footer)

Here is the error:

  (commit 1d9951c: not Signed-off-by author/committer/uploader in
message footer)

> commit 1d9951c5518a7bdf88a5de16a41ae2f337e1b2ed (HEAD -> master)
>
> Author: Jeff9Chan <jeff9_chan@asrockrack.com>
>
> Date:   Tue Jun 8 09:15:44 2021 +0800
>
>
>
>     add meta-asrockrack layer
>
>     Signed-off-by: Jeff Chan <Jeff9_Chan@asrockrack.com>
>
>
>
>     Change-Id: I1686133e0093e4e00adeadc068972396c8dc4fab

 I suspect Gerrit's filtering diddn't notice the s-o-b in the middle
of your commit message. Normal style is to place it at the bottom of
the on the line immediately above or below the change id. Try git
commit --amend and moving it so the message looks like this:

Add meta-asrockrack layer

Change-Id: I1686133e0093e4e00adeadc068972396c8dc4fab
Signed-off-by: Jeff Chan <Jeff9_Chan@asrockrack.com>

Cheers,

Joel
