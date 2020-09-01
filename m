Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9736125974D
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 18:13:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgsZV11sJzDqV7
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 02:13:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ca/f/Q+W; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgsXL1hG5zDqDB
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 02:09:49 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id v78so1103765ybv.5
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y5vxRbKmbecWnlE6MJhiOB1gVlRkbLa+rv7rNQ8bMfE=;
 b=ca/f/Q+Wy9Kp0ri2dPwjFawiH4jEDRNbxCsm66CStN/RO8X06VxhM7V1PXegViyJUK
 rrKPaBjwl5XJNuEuIxR+YVuyT8qf9JV9FWjN267Qj5oCkDn8QZNaKaN3LogGsi1xcJcs
 AsAc4nk6ZD9lt1xhuLcbLuNCsuV5a00C+KGmyPQ26+omfuyoHN6yg+t2wLWbtbJ/n3MW
 ufD0B9/b2Qm9yRVqL6oiT1n7FlceuUaBzyU7TDVPOnXLcIlVAslj+frCBMwvU9l442rL
 onKWO563Yx8WECXDJYr20c8+DGEKFrsEeVLVL8IdfeOIEyoSEiadmWe9Jzq/WGt41tFN
 f/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y5vxRbKmbecWnlE6MJhiOB1gVlRkbLa+rv7rNQ8bMfE=;
 b=SHfWL7Eg5lCkHboRSIB74VF05frbrlaJSm8whQ6H0NUi2r7czE6YItwyxXSdfQnwEq
 04yxIXPl131k/5An6vX8nm5yeRTukorvPVt0f/YQgowZK6ZbCYLJ8FTxmfJyTfN2TCIf
 s6K9F8pZDvM73BiCzP2vpidQihUxOReMY+d4fBQ+0lQceN4/iFCSlDAGLYiLYwmow7xa
 ntvi/7M0PbKSnWbxyf7GFY3Ng9SQl4Axio9GVCHvOE4r+XoMIUVX4xu9/TagwSy7dNBD
 AuzGsFWXVsga06TM0nsZjlTUHiOV1TApbrtzYeWqgpwagmX5LCvhTMtxeEENMM0Hr7ap
 eVTA==
X-Gm-Message-State: AOAM532d8f2ZajZoT5g+asjCLpDzHe1qKxpoamqGutgBVtJjYAKlPAsv
 hwMML/JBal3fyuZxPelkexXwguk6M8wwETO/qT7Mvw==
X-Google-Smtp-Source: ABdhPJznB1u1RN89xmMUFqtH3punLmFhULOLH5whA+4sFyLoAsb9c1pQo9pYy+F1NweEm07eu4ldSBiGNJYpAODWpnI=
X-Received: by 2002:a25:2d69:: with SMTP id s41mr3730741ybe.417.1598976585348; 
 Tue, 01 Sep 2020 09:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <c9737b1c67174a4fa9666b1d8afde380@SCL-EXCHMB-13.phoenix.com>
 <20200901122409.GQ3532@heinlein>
In-Reply-To: <20200901122409.GQ3532@heinlein>
From: Ed Tanous <ed@tanous.net>
Date: Tue, 1 Sep 2020 09:09:33 -0700
Message-ID: <CACWQX83AjdYMXYzsjed0p6GgEMBb18CtC9qb-9OPcU8HbzK7Bw@mail.gmail.com>
Subject: Re: When building OpenBMC . . . ?
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
Cc: Bruce Mitchell <Bruce_Mitchell@phoenix.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 1, 2020 at 5:26 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Sun, Aug 30, 2020 at 10:02:41PM +0000, Bruce Mitchell wrote:
> > When selecting Target hardware https://github.com/openbmc/openbmc#3-target-your-hardware
> > to build for the is a tiogapass, now if I add a meta-phoenix/meta-tiogapass/conf  how does
> >       source setup tiogapass build
> > know which tiogapass to build?
>
> https://github.com/openbmc/openbmc/blob/master/setup#L34
>
> The setup script just does a wildcard, which means you'll get the
> alphabetically ordered machine.  In this case, you should get the
> meta-facebook one selected before the meta-phoenix (supposing they both
> exist).
>
> > Or am I not supposed to choose a name (i.e. tiogapass in this example) that is already in the list
> > when I need to create a new meta-phoenix/meta-<machine>/conf?
>
> The overwhelming preference seems to be to not make another
> configuration with the same machine, and as one of the maintainers of
> meta-facebook, I agree in this case.  But, this answer doesn't solve
> your underlying question.
>
> I suspect you're going to make two kinds of changes:
>   1. Features you want to enable on Tiogapass that Facebook isn't
>      interested in.  (I would cover bmcweb 'branding' changes here
>      also).

bmcweb branding is a machine independent feature.  At some point we
might have the webui feature enable/disable things again, and who
knows, maybe we need machine specific branding, but I want to avoid it
wherever possible.

>   2. Fixes and configuration due to features we haven't enabled yet or
>      fully vetted.
>
> #2 should go into either meta-facebook (or the underlying code
> repository where the fix is needed).  These will be common for any

+1

Could we also make the statement that as a project, we will enable
every platform feature we are able to for every platform by default,
and if a company wants to specifically disable some features for their
use because they haven't vetted them, they should do that in a
specific distro?  Said another way, the "default" for every machine
should be every feature enabled, as that's what helps users and
developers the most.

>
> #1 should go into meta-phoenix.  You're likely the first one doing this,
> so we may need some experimentation on the best option.  I have two
> ideas (there are probably others):
>
>   * Make an alternative tiogapass variant, like tiogapass-phoenix, which
>     ends up including all the common tiogapass code from meta-facebook.
>
>   * Create a new distro type for phoenix, which enhances the underlying
>     openbmc distribution with your own branding tweaks.  You'd still
>     build meta-facebook/tiogapass but with a different distro flavor.

This one would be my vote between the two, and I think there's
precedent with other companies doing similar things.  Isn't this the
way yocto recommends?

>
> I believe IBM has experiemented with both of these approaches for
> witherspoon (see witherspoon-tacoma and
> meta-ibm/conf/distro/openbmc-witherspoon.conf) and might have some
> insight into what has worked well for them.
>
> I'm more than willing to work with you and your team to help refactor
> meta-facebook/tiogapass in a way that makes it more condusive to what
> your team is interested in doing.  I suspect we'll need to create some
> additional bitbake '.inc' files and move some of the content we have in
> '.conf' to '.inc'.  Catch me here or on IRC as needed.
>
> --
> Patrick Williams
