Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 050DE27614C
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 21:47:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxTGR3Gq4zDqdq
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:47:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=mL0iRaz5; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxTFh3CYKzDq8M
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 05:46:31 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id x10so566138ybj.13
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RBt675XMdXrGAJzP1JUzBcGq0YZOvWN2czlLNlqE7Fo=;
 b=mL0iRaz5Q8KfdmNeuhHi3TJCMU7EhOEKwHQmhHE/ZI2b3rjBG6QIArVV/ST9qABvwd
 /tj1JH9An/HV0hYq5LZYRgO5ayAec/qXtu0+p8beKa3TfgtZvp799HsybF6XgWRzNvgI
 qAOMv9uNo1oxkRiH5GBCaZaghSPmAQL7UEa3NeqFDwtvwzWjYsTKozPcT3CHa55g8JcX
 sJIjvFnexFusflev0cucuXr+asdPVBXqiU4zRPBIHgd2bKsbL5NgASTp+4lTWkB4KDPJ
 nyalJDJrDCXf2xhkExkHg1QmBscAb9I07oxNlPxD5Q/OYi+EUHs9KdqdUojGbl8S8VuA
 Sipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RBt675XMdXrGAJzP1JUzBcGq0YZOvWN2czlLNlqE7Fo=;
 b=qcAiQ8yt+c37EZfUOb+ORA10SCuqbpHSJN2BxaywRYf4kbnMgrlJS+wNGlQtUFwNE0
 oNLn3u6VUGUIMNjLezV7qRDT+fCK5j//6m5f3TwhSHQtbLxjO+BpcGw0lrwPuvo3CYcr
 /k08qV65+GAmInFI7KtQsgJjrPjXQMDcrzfU++d16b/HVO3lhMlk0KW1FSfJA7xgFmbO
 R8bLIUL8J/MV+lJUBcL2oejVD/7UV+6UKOtQM9yus7z5TH5x+sMYVgIVLVWOfZijvExa
 wEAqBtQvf3hptRPvkrugTcghILOvBI+HH58ocbdnuvmmyWcYUBN8mDrqsIIiYrIcuZlY
 lEdw==
X-Gm-Message-State: AOAM532dbKBs2niJYVUXzSY8/4vMCRC1aVxLZ9yTS1OjhEoas0DyGrGa
 PSUob8e8V+T5jVmrPYlvTGJETj674z6Et38+PvHuAQx9PFQEuBdn
X-Google-Smtp-Source: ABdhPJyyth3pDI/u77QI0JsTkvBPc//sAlQSmMOJLsDnU8Qd+UaG3QjEqGpYfxwYJtxOoT8lHK6ZV2S3ETcRYW76i4s=
X-Received: by 2002:a25:74d7:: with SMTP id p206mr2270548ybc.170.1600890387623; 
 Wed, 23 Sep 2020 12:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <20200921125540.4d6amvus3wt57igg@thinkpad.fuzziesquirrel.com>
 <CACWQX82i4k+PADJkOjDQEeUAQJtve+pySLRQVcqR7XayG5cJCw@mail.gmail.com>
 <20200921175227.zmdjbmixbwvstd4m@thinkpad.fuzziesquirrel.com>
 <DB1605BB-81F4-4297-9BC0-BC1B054BAAEB@fb.com>
In-Reply-To: <DB1605BB-81F4-4297-9BC0-BC1B054BAAEB@fb.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 23 Sep 2020 12:46:16 -0700
Message-ID: <CACWQX82ARgwPo1LCWF3fYZtzXtj4p=ty43xN21qX9GOZdzLKhQ@mail.gmail.com>
Subject: Re: interest in a minimal image recipe
To: Vijay Khemka <vijaykhemka@fb.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 22, 2020 at 1:40 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
>
>
> =EF=BB=BFOn 9/21/20, 10:57 AM, "openbmc on behalf of Brad Bishop" <openbm=
c-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of bradleyb@fuzzi=
esquirrel.com> wrote:
>
>     On Mon, Sep 21, 2020 at 08:53:26AM -0700, Ed Tanous wrote:
>     >On Mon, Sep 21, 2020 at 5:55 AM Brad Bishop <bradleyb@fuzziesquirrel=
.com> wrote:
>     >>
>     >> In what way does EM require intel-ipmi-oem?  I am using EM without
>     >> intel-ipmi-oem without (I thought anyway) issue.
>     >
>     >You're running Entity Manager, without intel-ipmi-oem, and you can r=
un
>     >a successful "ipmitool sensor list" or "ipmitool fru print" command,
>     >and have it return the entity manager/dbus-sensors/FruDevice results=
?
>
>     Ah, now I understand.  No, I can't do that.  But I don't need to beca=
use
>     the default IPMI handler implementations in phosphor-host-ipmid work =
for
>     me (the YAML based ones), and those don't need entity-manager.  I'm
>     using entity-manager for other reasons.
>
>     As an aside - I think a majority are using the intel-ipmi-oem handler=
s
>     now so I'd support moving those into phosphor-host-ipmid and using th=
em
>     as the defaults.  But that must not be easy, otherwise Intel would ha=
ve
>     just done that rather than forking the handlers in intel-ipmi-oem in =
the
>     first place.
> I support moving many standard commands from intel-ipmi-oem to
> phosphor-host-ipmid.  Entity manager is required only for fru and
> sensor SDR ipmi command but there are many other commands
> which are useful and can be moved.
>
>     But in any case, intel-ipmi-oem requires entity-manager, not the othe=
r
>     way around right?  The "feature" being selected here is the Intel IPM=
I
>     handler forks, and that would simply depend on entity-manager.  A
>     strawman:
>
>     obmc-phosphor-image.bbclass:
>     FEATURE_PACKAGES_intel-ipmi-handler-forks =3D "packagegroup-intel-ipm=
i-handler-forks"
>
>     packagegroup-obmc-apps.bb:
>     RDEPENDS_packagegroup-obmc-apps-intel-ipmi-handler-forks =3D "intel-i=
pmi-oem"
>
>     intel-ipmi-oem.bb:
>     RDEPENDS_${PN} =3D "entity-manager"
>
>     One prerequisite to this is that the intel-ipmi-oem recipe would need=
 to
>     move to meta-phosphor.  Perhaps its time for the repo to be renamed i=
nto
>     something else.
> We may have to split and look for what we need from intel-ipmi-oem. There
> are lots of intel oem specific command in this which are not useful for
> many other platforms and are overridden by their own xx-ipmi-oem.
>
> We should simply port standard ipmi command from intel-ipmi-oem to
> Phosphor-host-ipmid.

+1

>
>     >In my understanding, this shouldn't work, and we've had many reports
>     >of "I enabled entity manager, and my sensors don't show up in IPMI".
>     I don't think the answer to "how do I enable IPMI sensors" was ever
>     "enable entity manager" was it?  To enable IPMI, you have always need=
ed
>     to enable either the original YAML based handlers or the intel-ipmi-o=
em
>     forks.
>
> We should fix this in host-ipmid, as all sensors are added to standard db=
us
> Interface and if it is not discoverable by mapper or object manager then =
we
> should fix it so that an SDR can be built independent of sensor implement=
ation.
>

I agree with all the above.  Do you think you could get the patches
pushed to start this discussion in gerrit?
