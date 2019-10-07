Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF92CED25
	for <lists+openbmc@lfdr.de>; Mon,  7 Oct 2019 22:05:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nBKj3Lf3zDqM0
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 07:05:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mdSd63fh"; 
 dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nBK51rBBzDqKb
 for <openbmc@lists.ozlabs.org>; Tue,  8 Oct 2019 07:04:40 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id a22so15078707ljd.0
 for <openbmc@lists.ozlabs.org>; Mon, 07 Oct 2019 13:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tRO6qxVMaMrwRrjqbxwuM1u2Pbuw3lYqiBj6dsLz8+8=;
 b=mdSd63fhqw+QgpgUUNLod2sL/wJ+Jg6zuMi1blfnbvf+XtQ1Qw6q+UY1EX/jTuUEoa
 CDycwUFFwfu2YFXqT96imYduntNrNbl8xIZZiiX+GEInYhX4TzD02g6t4tKKHuJi57dN
 GnigsjEyMBkNoxovPP7BbXbzA6zmhzQ2VQaHeaUrQIMF8kLGKw8l7F4LQ8WSjk7TA+XM
 On5R+QcIHHuMWzFAYQYdRi4JvABYNsQCZiCC+ZH3jNE1mPYgRPiGqCGyGoBynUCf1Cij
 AUKWW4sncLg6I1Jj6hHQpQYWX8cFNGa5bVTj64gRuWfJqcfDiA3/wk4xyok8MC018kf6
 ab0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tRO6qxVMaMrwRrjqbxwuM1u2Pbuw3lYqiBj6dsLz8+8=;
 b=Y26EOEQf+fRyai8FcBy01Q6LimURj7VO8Lsj6V8jHWkihMc0cYKGrLscH9FADK7vz4
 YuWrfO+LECz1IKiHMeKoB1F3Ed3SYWloqrhDmPmNjpR9xsDOrOgSnkhZLhxOeDN0xv6u
 SY0Vtx5gLm/ZzwxoGYcCSRCYhOfelP+KcLLCJrBcxECi3rWCQwycvB/FBcBbBzFvF/AA
 YVKJyyBTw3GREDYMhIeiCyzJxWe/080bONXX1oaTsGKID0k2fDgKy/8DnrVsXYa4ebtd
 4z8RYayZ+tmRcynJfZ4RdAY3GLBcVI2+np60CgPfspHaOUbtBFS8hQzYMJNRr3RJEXLA
 iJKA==
X-Gm-Message-State: APjAAAXNM+zjik9Ph4n4SDjxuJ8oWFBzib+D/My0AvNOGf0LexXqLa53
 V6AgzaCmI/AfPxn9iNXsCI0ogyhdGw8rPMHToAoQTA==
X-Google-Smtp-Source: APXvYqzL0ETJJMH1uHkMhDqPgsDWrY3fLXc0kFG5WrCN4wN/Lw1OwR4+BTKYUk6zsvySF9M6tWKjnCn1ALPhQ7rYH6o=
X-Received: by 2002:a2e:9ac1:: with SMTP id p1mr19527347ljj.179.1570478675662; 
 Mon, 07 Oct 2019 13:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
In-Reply-To: <7050D8BB-A7B0-4CA5-AA56-8AB61D762AEB@fuzziesquirrel.com>
From: William Kennington <wak@google.com>
Date: Mon, 7 Oct 2019 13:04:24 -0700
Message-ID: <CAPnigK=c+rpWLtB7XbaPPM3s2V8TAbgRgqKChUTKkNpUtC836Q@mail.gmail.com>
Subject: Re: unit test build failure in phosphor-hwmon
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, Andrew Geissler <geissonator@yahoo.com>,
 wangkair@cn.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Well, the unit test environment is using gcc 9.x.x for what that's worth.

On Mon, Oct 7, 2019 at 1:02 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wr=
ote:
>
> I was trying to get meson going in phosphor-hwmon today and I stumbled on=
 a
> unit test that doesn=E2=80=99t build under gcc 9.1.0.  The failing test i=
s the
> average test.
>
> I just thought I=E2=80=99d quick throw this out there in case anyone feel=
s like
> having a look.  Also, I think this means our repository CI environment ha=
s
> gotten out of sync with upstream Yocto?
>
> I realize =E2=80=9Cpatches welcome=E2=80=9D applies here for both issues =
:-) but I just
> wanted to broadcast them.
>
> thx -brad
