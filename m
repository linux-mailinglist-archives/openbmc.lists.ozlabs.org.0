Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F957AA4F
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 01:13:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnZQF0hJKz3bl0
	for <lists+openbmc@lfdr.de>; Wed, 20 Jul 2022 09:13:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MFfPzbX7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MFfPzbX7;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnZPt3MQTz2xXS
	for <openbmc@lists.ozlabs.org>; Wed, 20 Jul 2022 09:13:22 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id q41-20020a17090a1b2c00b001f2043c727aso450832pjq.1
        for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2022 16:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eu3ir0HKPE1Wz4M0EVikC95DE22cS0BftbAnO66MRjI=;
        b=MFfPzbX7DFeodbnDlODP16eWOLK90kdXzp7fpd1weIsRfmgRyg1HwUH5YZdfUomY9T
         V8G+H5MpjBF0pW6MC2MqGBHSm0bo+pDux2UfS1hTr7eFrLhzJhOzQXs3LGP23ffMEtiF
         KwT7F+jaB5Ow5QPLUhkXZ7u0Ze/m67nw2lx9fRlxJVCf0wvlQAaoS4KJ9RX6GXxuDirN
         Xd7NNsD0rTF2az3KKLCprmmTX7jyL6L5S8ssEd6XFa3nmPNqu4u7sf09uyvu+P3rIbxD
         oMXlrC+C+a0w/PNznm7Ub0JsItAVR04LOP33EH2Mxe0sxSvAO7+68L7aoWkcARjbu1dg
         aZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eu3ir0HKPE1Wz4M0EVikC95DE22cS0BftbAnO66MRjI=;
        b=IU1u+erwpoScBq8LEZwsdljvUeN8K1EQdclZoNZKsGCSAXjzI+5rw/4SYioJvl6O+x
         NpRfPoI7mins8yxLbdksMv/7CDovwip58weDTEUMqScP52GteQzNhvzGSiMlpJaUvjFY
         P1G6u09RNMl873KtbkgvnhERbmbm1/VZZ0CEsmPZGJ5pbzkUGAq0rQCsRfxM1yPc9hhG
         lPd96/yEz2yBgsG814KUDsEHNWajrGhEBa+qye05iIEV/tAnYTRdtt26E+XdwjR9II4B
         ezRJboAHwjaCclfEv4g5T2ONQ2ne6rctnwOeVwSiRwG31icZPkkZFZiAdKQCxX0k7zMm
         7Y/g==
X-Gm-Message-State: AJIora8V8CHLUwF/FVELXmqaC1sFU7UpNR2Sf1C0EFkPvU+lkojYfS0w
	ahgq68KEySgAFYS8FfWTtqBPrl4q2CTHi5X7Tz92XfGRDYwoxA==
X-Google-Smtp-Source: AGRyM1sgdcZ8PFsUqYTEXEeMy40U9Q7dcSvTVeCKBT+syYqJ2Lc3kXqGCOmLY5YQJPUCTFaX0fqZoOoM8cbI+oK5cIE=
X-Received: by 2002:a17:902:ce0e:b0:16c:7977:9d74 with SMTP id
 k14-20020a170902ce0e00b0016c79779d74mr36022714plg.92.1658272400031; Tue, 19
 Jul 2022 16:13:20 -0700 (PDT)
MIME-Version: 1.0
References: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
From: Ed Tanous <edtanous@google.com>
Date: Tue, 19 Jul 2022 16:13:08 -0700
Message-ID: <CAH2-KxBRecff108sA8KEGS_zyuSsqp6M_Y25GzPuOYn-1fMyVw@mail.gmail.com>
Subject: Re: 2022H2 TOF Elections
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 19, 2022 at 2:10 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Hello Developers,
>
> Since we are into July, the 2nd half TOF cycle starts.  See this
> document for a reminder on the process:
>
>    https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md#terms-and-elections
>
> There are 3 important points:
>
>    1. The current TOF publishes a list of eligible developers for the
>       next TOF election (that is the primary purpose of this email).
>
>    2. Nominations are open for TOF members and run through the end of
>       July.
>
>    3. The election, if necessary, is to begin September 1st.
>
> Now for the details...
>
> ## Eligible developers.
>
> Contributions made from January through June qualified for this TOF
> cycle.  We have 82 developers [currently] qualified for voting in this
> cycle and they are listed here:
>
>     https://github.com/openbmc/tof-election/blob/main/2022H2/rollcall.json
>
> Anyone who feels they made contributions to the project which did not
> show up in our metrics may request to be added to this roll-call by
> opening an issue by July 31st to the current TOF at:
>
>     https://github.com/openbmc/technical-oversight-forum/issues
>
> ## Nominations for TOF membership
>
> We currently have 2 TOF members who's term is completed and 1 open seat,
> for a total of 3 seats available during this cycle.  Nominations, either
> self-nominations or of others, should be sent to the mailing list by
> July 31st.  Remember that only those qualified to vote may be nominated,
> but anyone may nominate someone from the roll-call list.
>
> Brad and Ed are the two members who will have their term concluded and
> the open seat is due to a resignation.  If we have 3 or less developers
> nominated for the TOF then the election will not be necessary.

I'd like to nominate myself for reelection.

Thanks,

-Ed

>
> --
> Patrick Williams
