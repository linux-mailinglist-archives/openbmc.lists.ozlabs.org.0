Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C524299FF
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 01:55:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSwdp59n5z2yMH
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 10:55:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=D/51XSWp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=D/51XSWp; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSwdQ68mFz2xtQ
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 10:54:48 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id k7so60987685wrd.13
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 16:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7B7F02q6Ksbttv6l479nmG75DA3Y9Z1/PKHmikza7HE=;
 b=D/51XSWpDi4+1vr+dZcXC9ruGLqOU5Y789pAFrXC/h6grryN9pxQB0S04CnLz1wflP
 dw+ocrmcfGuM3OCCVsxYhgiQa635k2qZvT2DoeIKzzKlyQh0otBehK3vincF7R2CoUVK
 K7XbFLbp5d4s0HxrR7UYd4jNFVVuqCV1wIw4ap16JnwdzbvRG8OKPHBPyiCVNHVUEs5l
 Q3etNp5SSiroNLMZSwcCUbrKxSkZbqYrIY/eIqaZRh1GQuQBW5e4dWCzzcB+33OhwouV
 f+Ss4j2exMPqTrTHyS7ZrHvBrSCp3cRFZLWFHOykaKk9ztt00tqjvRKomigquaqN1iQF
 Pk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7B7F02q6Ksbttv6l479nmG75DA3Y9Z1/PKHmikza7HE=;
 b=RQWENvCK6HP73tJXiTSa7hUs/W0xxhnnZu5E0JKe9KIuOW16raqzeUMQmZ5I2KXC87
 60eQgNKDI2o08p5Rw+mKCiGL7fnxyD05E9hYsGv7pmMgDhu5rxmd5cEipucWB9/IEvBY
 SSGtxY+LHxwcS04pyUFOGdA6aZ1kt3MsF3nOoXHohaoBCCQDwgRWtynupvYRWnzVH6Uh
 lZ+L6z36LEXLynegh6X3IJEgrwv3uOTW93ynFB/ncyuFfr9XpyFEIN4QGECEyE7pcGup
 UjrrFjcKi5MScKiu0r9EsLYIK2QzGb3KLbD4xNa3+Yi3fA6Gb0uTkzH06ydihb/K+ucW
 oruw==
X-Gm-Message-State: AOAM530d1230na4cddutReGNLiLHZBCNBSZRPr1CRPnn7IgeXZ9fICag
 O3VVuNEp/TC8Jagmf3l+e5HW5gt9CyL2OCb+qXrn6nQQfDfMgQ==
X-Google-Smtp-Source: ABdhPJwP7jldRsS6mkro5CooCYiTTAz8R1XjwK/4vqp1BGUTHMiNJ/rTxC+7EI4+OhKPm2hpxmhgXmttgVhbj2agXhA=
X-Received: by 2002:adf:b1d7:: with SMTP id r23mr28678637wra.145.1633996482260; 
 Mon, 11 Oct 2021 16:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <E9902E4C-0786-400D-8920-9D1FDCBE001F@linux.ibm.com>
In-Reply-To: <E9902E4C-0786-400D-8920-9D1FDCBE001F@linux.ibm.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 11 Oct 2021 16:54:31 -0700
Message-ID: <CAH2-KxB6P2HTE5iqJMx1Gwrrq_w2-gXCZ47ZXaO_x5kZ2RAzCg@mail.gmail.com>
Subject: Re: Changing the os-release BUILD_ID back to its default value of
 DATETIME
To: Adriana Kobylak <anoo@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 3:00 PM Adriana Kobylak <anoo@linux.ibm.com> wrote:
>
> Hi,
>
> There has been some discussion in Discord on how to work around the "Same=
 version" limitation during fw updates, and having a timestamp field that c=
ould be used to generate a different version id (commit id plus timestamp f=
ield) for every build seemed had positive support in the discussion.
> Also at IBM we were looking for a field that could display the date of a =
build, such as the release or general availability date.
>
> Looking at the BUILD_ID description[1]:
>
> BUILD_ID=3D
> A string uniquely identifying the system image originally used as the ins=
tallation base. In most cases, VERSION_ID or IMAGE_ID+IMAGE_VERSION are upd=
ated when the entire system image is replaced during an update. BUILD_ID ma=
y be used in distributions where the original installation image version is=
 important: VERSION_ID would change during incremental system updates, but =
BUILD_ID would not. This field is optional.
> Examples: "BUILD_ID=3D"2013-03-20.3"", "BUILD_ID=3D201303203".
>
> The yocto recipe for os-release sets BUILD_ID to DATETIME by default[2].
>
> At the beginning of time, the BUILD_ID in openbmc was set to have the con=
tents of git describe[3]. Its contents now are the same as VERSION so we ha=
ve duplicate information:
> VERSION=3D"2.11.0-dev"
> VERSION_ID=3D2.11.0-dev-566-g263df7f852
> PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distr=
o) 2.11.0-dev"
> BUILD_ID=3D"2.11.0-dev"
>
> If we let the default DATETIME value be built, it'd show in this format:
> BUILD_ID=3D"20211007135305"
>
> To re-generate the same image, BUILD_ID can be determined from the image =
file names, such as:
> obmc-phosphor-image-p10bmc-20211007135305.ext4.mmc.tar
>
> Then BUILD_ID can be set in the conf file, and the image for that timesta=
mp can be built.
>
> Also individual meta layers can choose to set BUILD_ID to any date that t=
hey seem relevant for their releases.
>
> Any opinions on changing BUILD_ID to its yocto default of being a timesta=
mp?

+1

>
>
> 1. https://www.freedesktop.org/software/systemd/man/os-release.html#BUILD=
_ID=3D
> 2. https://github.com/openbmc/openbmc/blob/3fc98fdca6aa7512a4656bec7422f5=
57c8e17555/poky/meta/recipes-core/os-release/os-release.bb#L23
> 3. https://github.com/openbmc/openbmc/pull/78
