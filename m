Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9997498FCB
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 20:56:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjLNN4zh0z3bVf
	for <lists+openbmc@lfdr.de>; Tue, 25 Jan 2022 06:56:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FkOPIukO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=FkOPIukO; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjLMy55PGz2x9p
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jan 2022 06:56:29 +1100 (AEDT)
Received: by mail-wm1-x336.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso153177wms.4
 for <openbmc@lists.ozlabs.org>; Mon, 24 Jan 2022 11:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kqRFEZjEFFlIKzrjDxgWvcYGHblTsDjKBUOYX0qoyEI=;
 b=FkOPIukODKmAiPvqyD2CvJA3+kanEDYT37+Ua9gbREn4GqyG93g7Z1z792C/8IXoLQ
 5IpGtLveIONgKuK7LPzcSRl0XApr0z0kn3yh1g/l9EtxzpdMROSpYzpBFhXoD3ScKizQ
 ZFvnDGCREm9vgv29TrxoP/lbJKFo+1BEFJZdOxvrHn2n52khUdufHnQKsui0L9naL9nY
 xaexoxu8JJ5oN1i0LV1cee53Y2++mdca0dBLLmpwm1xTYceIV4zdgRc36reAPsxfg/7I
 j8DL1h29CO8sf5FLbs2WbuWEMwmVAFYuUBvS68JZySVXTw3lJqylNjogYakmGw9k4L10
 7GGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kqRFEZjEFFlIKzrjDxgWvcYGHblTsDjKBUOYX0qoyEI=;
 b=xJnlpevWED0/iLqFSDICzOs2J/qMU5aeebfLhewXzNsWLrgMb2eYdchkc2ibvR7S01
 3BgMMnPfvJ6O/loUVVsvvUf2/LdM7Fux8R72i5I61oVlqOITEoAD6pwmNX5vit6EFNAw
 oNupolpM/URJd1hYhaSeR9B0++hJLCKtcflyersqel6Ft4jxRsgWO79KrHyBbKMQh4rK
 Em6kDXzh0Ee9foj7RddXOMqV2u/ySXmS6k1IEtO8PGDAZU/iHRoWIQaD0/tW0BagBb5b
 Wdh3u8Dp+6Uu4GmQGG3rw1capmRGgFsYsb3oCkDWjQp9VYfEZxSFo52HQl7vGsgAxNIg
 AiGA==
X-Gm-Message-State: AOAM533EiyahLo4whVlqt8Zi3KCUoA9rrx5r5yzOL1PT1iDL/y50sj24
 avXREJkryaoSa1BLiAMlfwjwlMY8PdSOatvqkCU/TQ==
X-Google-Smtp-Source: ABdhPJyvRFs6pzG9CY8azLtSUiStCjbll3L1H6o/tFXCBnj5CAOxo2IK9L9VLcE+hGX8kaYUIqUC0JtK9j7595vP7Cs=
X-Received: by 2002:a7b:c096:: with SMTP id r22mr3107331wmh.160.1643054183789; 
 Mon, 24 Jan 2022 11:56:23 -0800 (PST)
MIME-Version: 1.0
References: <YdiCUiwh1iD4ycr8@heinlein> <YeH2OHImO/oRgkjN@heinlein>
 <YeH5uCwUQ02RrGok@heinlein>
In-Reply-To: <YeH5uCwUQ02RrGok@heinlein>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 24 Jan 2022 11:56:12 -0800
Message-ID: <CAH2-KxBAxkZps=+Sy1xZCD=+D2bzMATd58tUEnzAH5ZBXPhZ3w@mail.gmail.com>
Subject: Re: TOF Nominations
To: Patrick Williams <patrick@stwcx.xyz>, William Kennington <wak@google.com>
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

On Fri, Jan 14, 2022 at 2:31 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Fri, Jan 14, 2022 at 04:16:24PM -0600, Patrick Williams wrote:
> > On Fri, Jan 07, 2022 at 12:11:30PM -0600, Patrick Williams wrote:
>
> > > * Jan 30th: Nominations (self or peer) for TOF seats must be sent to the mailing
> > >             list.
>

I'd like to nominate William Kennington to be on the TOF.  He has been
a long time contributor to the project with commits going all the way
back to January 2018 [1].  He has hundreds of patches landed on
master, and maintains a combination core libraries and
end-applications, and has a long history of both significant
improvements and cleanups.  This round of voting shows he's 1 of 12
"highly productive" members in terms of participation scoring [2].  I
think he would be a great addition to the TOF.

[1] https://gerrit.openbmc-project.xyz/q/owner:wak%2540google.com
[2] https://github.com/openbmc/tof-election/blob/c50f5beea2be92806cebad57486474c7dabecef2/2022H1/rollcall.json#L85
