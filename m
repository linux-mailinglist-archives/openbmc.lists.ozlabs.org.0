Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BD4DD791
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 10:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKfch5fMFz3bNx
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 20:59:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h6AK5fzM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=hughsient@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h6AK5fzM; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKfcC2K1qz3Wtr
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 20:59:06 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id s29so13230224lfb.13
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 02:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ZeFOFDwQlgMY+DqmfHxqDC4nyrCMwL6jBHQxBJ6uuU=;
 b=h6AK5fzMqQbknXgcNCaK8pzLqy4+/yGxE0nj2fO/ZSKTlaTT7O88e86NrETODtOh7V
 71+4jHkjBS0prGiBDOxpw9nUz5TB+Gqh+WV/683RGHq2DtFQ7K8IcbZyqOMc9PPJTsjq
 K2XeGpGWA+cYyT/5fHTQPywv+LHyaXbLsdgGlHUWHln8U00cWfSXhZsmouhw4shw6D4d
 lH5nd94aILbJtGxj8m2HToSDWOAkun6eZH2zC2mNzlBq2zXnbGINGS9cQZTB3aS8hqm1
 YgWI+7TRQvGlbDvjeJssQSY4yFI1tdg2/F3GhxOQQ6FoNn04CwCSjnQn4GEATCCo9UtW
 /W4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ZeFOFDwQlgMY+DqmfHxqDC4nyrCMwL6jBHQxBJ6uuU=;
 b=LWhrWSh38/MNNKgNNPyW+8miiA+zFfJ1Bq3GT9LtOxYojPEeSwC06H2mdSG+H5kVnY
 V4IZFSLnKNNjeWggN1gpSO3/ZFuZaKCXHVlpWMvsJ85M52D+/rYfAahI1klbtBp6HYSH
 pC7hzEn69n099O5Ej73AOFxHbx2GgOJ4vBXWs1kG0NAyVvVTH3h2BnVQ3MUykgwLQWgt
 AnccC5MZOKTOM37bvJ6pH0pvNbqs4q6EpYhLbOZ8ysY4WwA621VnhBpKnv8TrBuw4XDz
 k/E6A12ePEAnYsBRm75hu/6DZhm5hmK95fnUO2mjro5F/fsQfycdPPbMvBu3tW5KMOdA
 W6og==
X-Gm-Message-State: AOAM530zrsWH1a1i0DgZTDe7N0G4hd+CynbuwDYPK45/l+fEXvCcUmTu
 ZM27M7XsYWClCfzMTyKlqzdnkFGU4bOEQ1XogwA=
X-Google-Smtp-Source: ABdhPJwQqdo2u/hGmsOeuZqhG43/v4zEV88bzOhNz5h95pAwlKWGFO6XMcBdyMi4mdSt+JjIyNMV8bSmbIXl4lOVXAI=
X-Received: by 2002:a05:6512:1045:b0:448:c883:7463 with SMTP id
 c5-20020a056512104500b00448c8837463mr5558847lfb.51.1647597539493; Fri, 18 Mar
 2022 02:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAD2FfiEKfS-=ER9qJ9mftjCsiAiseytrDCcbiCn+EcyKOLd9Mg@mail.gmail.com>
 <YjO0QqLKbNned7dk@heinlein>
In-Reply-To: <YjO0QqLKbNned7dk@heinlein>
From: Richard Hughes <hughsient@gmail.com>
Date: Fri, 18 Mar 2022 09:58:48 +0000
Message-ID: <CAD2FfiGFTe-6Ut+Pg4+3jSUrwzwASMCm6=vmsPnXrTsk8jYWfw@mail.gmail.com>
Subject: Re: Software Bill of Materials
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
Cc: openBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 17 Mar 2022 at 22:21, Patrick Williams <patrick@stwcx.xyz> wrote:
> there appears to be a good amount to digest.

Yes, agreed!

> I believe most of our BMC images actually are much simpler than you've laid out
> here.  Typically it really is just the BMC code and images for any other devices
> are updated independently.  For the BMC that means u-boot, kernel, rootfs.

Ahh, no binary BSP/FSP does make things a lot easier.

> Do you know if there has been any effort put into this at a Yocto level?
> bitbake already has all the source code used to build our image and all the
> metadata about how it was built.  It seems like they could add the SBoM to their
> build process, if you wanted it on each package in the rootfs.

Not bitbake, but there are people doing the same kind of thing in the
EDK2 tree, i.e. generating the SWID metadata at build time
automatically with a "vendor.ini" file in the toplevel to provide
entity details.

> Alternatively, would something as simple as the git-commit of the Yocto
> metadata used to build the image be sufficient for a SBoM?

It's some of the metadata we need, but it's not the "who built" part
-- which is the most important bit from a SBoM point of view.

> The Yocto metadata
> itself contains hashes (or git-commits) of the source for each package
> bitbake built.  I don't know how far down into the onion you're expected to peel
> for whatever these SBoM hashes are.

That's a valid question. I'm guessing less granularity is fine -- as
it's not like your kernel was built by a different legal entity to the
openbmc binaries -- it's all done at the same time.

> I'm not really sure where to go from here.  It seems like, since we've built
> everything on top of Yocto, having someone go write a bbclass that creates
> whatever coSWID data you want from existing information the bitbake recipes
> already have would be the start.

Agree. I'll take this discussion to the Yocto mailing list, and then I
guess OpenBMC gets this "for free" too. Many thanks for the speedy
reply, it's most appreciated.

Richard.
