Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D927B572301
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 20:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lj8lq5tQQz3c3D
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 04:43:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UVD/5Z+S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com; envelope-from=brandonkim@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UVD/5Z+S;
	dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lj8lR2nr0z3c1l
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 04:43:14 +1000 (AEST)
Received: by mail-qv1-xf36.google.com with SMTP id p14so3197836qvo.9
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 11:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=7iItdsJZ5oSvFiBQ+5OxpN3Wc+QTCtC+5ofYnqmy4oY=;
        b=UVD/5Z+SGBuIZajvKNDalepDPweJ8hBo4j3UV3a4+l7YOe70NfcqRT2sGMJ4xSXhd4
         i7qHKO8hguFUZpLGBoejcMd/aK6mSmsZRmBGWXqjfk9r6Hm6bZVT0Y8Mx67uDUHEXx3z
         Y2pOkDCcFzCkWbPAN583ZMDSJhyMmZvTp454lh/3n3k507MoRcPVTbYu2aoc8qbScoqo
         qzK14R9MU7r4nseVAfBn8tO91cGfax2ddjnyaWHosum+gwANybtPHF82hUAvnR2y7rb6
         IWnImvZJGVsBdBFcNOLCqEz9aVcBnA17dMpM81h+vhtvx+oiMP3A2JSab/p8UiR8d5h2
         YVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7iItdsJZ5oSvFiBQ+5OxpN3Wc+QTCtC+5ofYnqmy4oY=;
        b=qT5KZmceJ5G6qoulTcE5PWU3S/M6tIMxMh4D2gvbaaIuCrECivDRKIPUC4llzfita0
         xsDX00jmNOc+m9xGshSBkCehGx1ChJSH6Nlx91RwMqobpdQ9o7FaWz9EeJr75xPfRBHe
         GmLN+mPVtNQW9wac6uWYhz8NmADSzTk7GqmAulaIwRq/AH9T7VT5Puz1RuMbPV48KD24
         fhnlPOS+ARuonymqdoCJv128Y7rMs0HoCwxXq7fClPooTlM+K8VfIYnc32vSuqJEwCJT
         0ut9/oBaPX0WcU88smtKyCBfku7hrQQ4Gz09jK+fZ5C+/8PcSTAwkfX6rDJ2Ua/Muxnj
         vWGg==
X-Gm-Message-State: AJIora//El584h4GnM4GhpUMTy8hnzZ728noffiK2kaphilxYOREOD6a
	i997ebh918/L6SxovuyaDBdI+8JbdeenQMTSObg578Qz5I992w==
X-Google-Smtp-Source: AGRyM1vl10hiSmZXh6rjj+gBOlyHjt25uwWR7mAu7s0QeiVIaQO6v/r6ATsLnnZNiliVcL3WCgiD1Pd5h9PhwnfAuA8=
X-Received: by 2002:a05:6214:27e3:b0:472:ece6:3af5 with SMTP id
 jt3-20020a05621427e300b00472ece63af5mr18911626qvb.63.1657651389145; Tue, 12
 Jul 2022 11:43:09 -0700 (PDT)
MIME-Version: 1.0
From: Brandon Kim <brandonkim@google.com>
Date: Tue, 12 Jul 2022 11:42:58 -0700
Message-ID: <CALGRKGMTT4Rb-VzxBh-2zQKXkDHH7Cye1YzqyHxJZp-09A=ggA@mail.gmail.com>
Subject: Request to add "meta-google/recipes-google/console/glome_git.bb" to
 auto bump
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000036732005e3a00ad5"
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

--00000000000036732005e3a00ad5
Content-Type: text/plain; charset="UTF-8"

Hello,

Following the instructions in
https://github.com/openbmc/docs/blob/master/meta-layer-guidelines.md#dont-use-srcrevautorev-in-a-recipe
we'd like to request "glome_git.bb
<https://github.com/openbmc/openbmc/blob/master/meta-google/recipes-google/console/glome_git.bb>"
to be added to the autobump list if possible (or let us know if the
instruction is outdated - or if there is concern for adding a meta-google
recipe to the autobump list). It points to a public github repo under
google: https://github.com/google/glome

Thank you,
Brandon

--00000000000036732005e3a00ad5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>Following the instructions in <a=
 href=3D"https://github.com/openbmc/docs/blob/master/meta-layer-guidelines.=
md#dont-use-srcrevautorev-in-a-recipe">https://github.com/openbmc/docs/blob=
/master/meta-layer-guidelines.md#dont-use-srcrevautorev-in-a-recipe</a> we&=
#39;d like to request &quot;<a href=3D"https://github.com/openbmc/openbmc/b=
lob/master/meta-google/recipes-google/console/glome_git.bb">glome_git.bb</a=
>&quot; to be added to the autobump list if possible (or let us know if the=
 instruction is outdated - or if there is concern for adding a meta-google =
recipe to the autobump list). It points to a public github repo under googl=
e:=C2=A0<a href=3D"https://github.com/google/glome">https://github.com/goog=
le/glome</a></div><div><br></div><div>Thank you,</div><div>Brandon</div></d=
iv>

--00000000000036732005e3a00ad5--
