Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42231131DD5
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 04:07:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sHNV5DBPzDqHV
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 14:07:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235;
 helo=mail-lj1-x235.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LqDoRsOZ"; 
 dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sHMk01g6zDqHP
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 14:06:23 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id y6so45087538lji.0
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 19:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Fb8D33Yhe/oEYihydW6deuwso6dRDuK+ukLAAvg9Sjk=;
 b=LqDoRsOZRobgnWYDEU0WoVYmScrCaJbOZMvvvueDXuel8z4AoxxQHKBbiF3o4isS5U
 EhYsdpL3eQuD6kQsJy9VB6UboD8MonuohROqJh0XDAUGWGJcsSTsgDpNS6a6D2n8+C/y
 VylUwktqqWBsZnbjOx2g6tSeJKQnzwY2MHm4V9v+AWm0jJ7paCJBSF3wmuXwQg1oMCt0
 MtsjMXFKIwavvGc2LjO3bElpQjUf0SDAQd3potMMYUQBqTCR16DLNkpEaNCQoQdOYiYp
 MU/9to15h2tmTKVSmrAKBvOmyLV7v5kTVZ0cJybm/5nDI6ui9/O5KBF9/nsUq7qRvDy0
 ethQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Fb8D33Yhe/oEYihydW6deuwso6dRDuK+ukLAAvg9Sjk=;
 b=PkbefzoczvdN4MkgpssGjaP0tZErlUyfmfrqO5QayaSfrUsiKr0bh0ioH6NmbX8lg/
 CzjDbVvodQMVfvtTgFDFDtIXMHtPj0GDxvx6Yrb0QVo+axf/7O2Na8D5LgiXcJavTumx
 eKeycmebAu2vlhmVUTDO0X3STQdjMN9t2GFGcolulzyd7scij5XHzwLOnm9X4BwrhdbZ
 3swzKAjUs+a7MwLMfNaewLLTKiimz5Jqg+vCDmKkHAfXAkMCbwafIOqWy7S479C2fBi+
 vqTHdckW2fsWu51XQC0biR5VvE+X2HI9vyTiaBROzUe5N5f5NBH7kiEUXyVZNXEO0aHm
 gV/A==
X-Gm-Message-State: APjAAAXh1vrh3B5EG9w9qZhMXqeSuHJqwU+jvOa4t2yEazoQ5BK4i6gz
 cTY3dwigUtuzf8D3ntPsmwugqEI2H3qICJ7VACM=
X-Google-Smtp-Source: APXvYqwPkznDZja/VXnnAEGryjgZK3jx+3jb+T5vqotx9/CN+UOEYjLOP9WMqZS8/OqXRSg6PwjyVv07V2k1ZH6MRuI=
X-Received: by 2002:a2e:a486:: with SMTP id h6mr49740735lji.235.1578366377717; 
 Mon, 06 Jan 2020 19:06:17 -0800 (PST)
MIME-Version: 1.0
References: <CANFuQ7A8xB_xaqMB0fj394Ov9E3RvhOvj7OVVXgqDfA51YDsSg@mail.gmail.com>
 <1B3B2725-9C0F-4829-82BE-7FB35C558AB5@fuzziesquirrel.com>
In-Reply-To: <1B3B2725-9C0F-4829-82BE-7FB35C558AB5@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 7 Jan 2020 11:06:07 +0800
Message-ID: <CAARXrtntZVsNNBNMO_y_ZVzP13qF-yuCytT8uty5GuVSmwQ6qw@mail.gmail.com>
Subject: Re: HTTP redirect to HTTPS for web UI
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 George Liu <liuxiwei1013@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 6, 2020 at 11:20 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Oct 31, 2019, at 9:45 AM, George Liu <liuxiwei1013@gmail.com> wrote:
> >
> > Hi All:
> > I'm working on http redirect to https task(https://github.com/ibm-openb=
mc/dev/issues/895).
> > I took a cursory look at the design(https://gerrit.openbmc-project.xyz/=
c/openbmc/docs/+/24173) and did some testing.
> >
> > In bmcweb, I find it the current communication logic can only listen to=
 one communication protocol (http or https). If you listen to both protocol=
s at the same time, you need to change a lot of code and communication logi=
c.
> > If we are going to implement this feature in bmcweb, it costs extra eff=
ort and it's likely the implementation is no better than Nginx. so I prefer=
 to use Nginx.
> >
> > Please everyone stay here to discuss and leave your comments.
> >
> > Thanks!
>
> Hi George
>
> I see you implemented this here:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/meta-openpower/+/28099
>
> I=E2=80=99d like to propose this go in meta-phosphor and not meta-openpow=
er.  Does anyone have thoughts on whether or not this should be enabled or =
disabled by default?

As I remember we had some discussion in the mailing list, and Intel
indicated that it's not a wanted feature.
But it does make sense to put the recipe into meta-phosphor, and one
could enable it in some company or machine layer.
