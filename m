Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1EE9668A
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 18:38:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cc1N20bFzDqGQ
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 02:38:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=wak@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VhBp5hTr"; 
 dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cbyp6Hx2zDrNy
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 02:36:18 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id e24so5725470ljg.11
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 09:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kMgmYySjrlSNpT/HK/XuqaPomzojhSx6QqT0oTUkuH0=;
 b=VhBp5hTrC+GsGh7/l7bXqB6imBad2PLHHxwoK94gQz0pZfIyUqoQQWqEl7XXNOS8dI
 jMuwuO65IhW+XZQZ578ZcAZSRrdhxdbJUiImuGThWPXqfBskyY46btClMEG4nPz7tvc7
 zyiBmKgiOUP+Xrg9Sz9w20d3L+ZoPikYJKo2IByIK9Qv2BkCDsBbmfCoocS+7YA3agTu
 tbTk2JCEZpOCnmHgXfQqXmdy0canozMDNPRVAK4D6D6tOR8cxrKCRpWvbs++GI23yCZV
 d4YhEt22Fumyc59nYvMyPaJRQL2i9tD6b+TAr/iGFkD/0EMMU9+KKnaFm+QMUuM1PUcH
 GJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kMgmYySjrlSNpT/HK/XuqaPomzojhSx6QqT0oTUkuH0=;
 b=LzXm/2gPdBI+LrquqLjsLeFhL9sADMRgWulX2L2vGqqZyNd97R0kq47IbpSlOct6mR
 emVU7lZen1vgP5IQloUCdAkLG13QoMCKcF1Nhxrdhol2J7RimQ1x5Mk/VRkC/jhpryFz
 CGnaSl8zl7hjUSRFH5mOn92X85PwzvsEMq6fAfh22Q2Kt3yDn20jZ81V2sz9gjzUKKET
 wW9IDLrFSbT17rQ60jZs2406HCizWbXO6xF0QyHm7MCxpL8B58D6nnfyuQY9GOfd0pdN
 xvoab4QAP1Rs7WysVXg09zYwymtTkelg0B6FrCVeC5mO7y0zB3rrSZar6u4eaulG/8uf
 iH4w==
X-Gm-Message-State: APjAAAUrPrilj+9lW3YcV6rArqeT+2aapA6OrQMnHRKCcguEJo4Emymp
 zejyJzAF9RhWFdlNit9QgLUj4z2Oos88gQE2bw3JzA==
X-Google-Smtp-Source: APXvYqw3qS0bzZi/WqSfsCTrolTblr2/6DKgPManFzGr0Aizma734CraCMnQSag6Sblit6JsXfK8AofCjbSJNgBDKCQ=
X-Received: by 2002:a2e:97cc:: with SMTP id m12mr16393878ljj.24.1566318971022; 
 Tue, 20 Aug 2019 09:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=pv9GdHmv7ZJOBK+Z1wqAh4DmOzVR8ud=+KefddvEkreg@mail.gmail.com>
 <9ad991fb-13fe-42fa-b5b6-48fd069342f9@www.fastmail.com>
 <e4636a3c-82b8-0f35-ebad-6b23e304dc3d@linux.ibm.com>
 <f459cebc-ab70-08ee-7ea7-2647e41b3c04@linux.ibm.com>
 <96f668f0-9580-44a4-9bbd-ca6324494017@www.fastmail.com>
 <3645ad01-172f-be62-0531-6d0660fc211a@linux.ibm.com>
 <CALLMt=ppYod6utC-W4mojmefn_Yqt_K0FyUKhAKaZgYJugrUzQ@mail.gmail.com>
In-Reply-To: <CALLMt=ppYod6utC-W4mojmefn_Yqt_K0FyUKhAKaZgYJugrUzQ@mail.gmail.com>
From: William Kennington <wak@google.com>
Date: Tue, 20 Aug 2019 09:35:59 -0700
Message-ID: <CAPnigKn78Wn1SDnhRwZY7O9F5bgCnpUWBgvheDJdzAAs8zO87w@mail.gmail.com>
Subject: Re: where to store application json
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.ibm.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I think it's pretty straightforward, immutable data is stored in
/etc/<appname> and mutable data in /var/lib/<appname>

On Tue, Aug 20, 2019 at 8:23 AM Andrew Geissler <geissonator@gmail.com> wrote:
>
> Thanks for all the good discussion. It seems like in summary the
> consensus is what
> Andrew Jeffery proposed:
>
> /etc/<application name>/
>
> There are security concerns with this but there are a lot of files in /etc/
> that could cause security concerns if people get the correct access
> to modify them. For my use case, the json is simply something that
> tells the application when to log errors. If people find they need data
> files which could have significant security concerns, they may want
> to revisit the location for their config file.
>
> Andrew
>
> On Mon, Aug 19, 2019 at 12:15 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
> >
> >
> > On 8/18/19 7:15 PM, Andrew Jeffery wrote:
> > >
> > > On Sat, 17 Aug 2019, at 02:24, Joseph Reynolds wrote:
> > >> On 8/16/19 8:31 AM, Matt Spinler wrote:
> > >>> On 8/15/2019 6:59 PM, Andrew Jeffery wrote:
> > >>>> On Fri, 16 Aug 2019, at 07:01, Andrew Geissler wrote:
> > >>>>> As we start moving more and more of our applications to using
> > >>>>> runtime parsed
> > >>>>> json files, it seems like a good time to come up with a standard
> > >>>>> location to put
> > >>>>> the json files. I think a requirement is they be in a writeable
> > >>>>> filesystem
> > >>>>> (although that may bring security concerns) so that you can edit and
> > >>>>> restart
> > >>>>> services that use them on the fly for bringup and debug.
> > >>>>>
> > >>>>> /etc seems like the right spot. But if so, where in /etc
> > >>> While convenient to the developer for testing, to me it doesn't sound
> > >>> like good practice to put read
> > >>> only, critical files into a writeable spot?  How could we even trust
> > >>> data that comes back to us from
> > >>> the field when a user that can get into their BMC can just change
> > >>> these?  Or accidentally
> > >>> delete a file?
> > >>>
> > >> One security concern is that config files offer a good way for hackers
> > >> to get persistent access to the system.  That is, if they are able to
> > >> get root access to the BMC one time, they may be able to persist their
> > >> hack across BMC reboots by modifying some config files.  IMHO, to make
> > >> it harder for them, as much as possible of the file system should be
> > >> read-only, and read-write config files should not offer the above
> > >> mentioned service to hackers.
> > > What are some concrete examples of what you're concerned about here?
> >
> > I was thinking about config files that specify which plugins to load,
> > for example, by absolute pathname.  In this scenario, the hacker would
> > write a plugin, and the first time they compromise the BMC, they copy
> > the plugin to the BMC's file system, and modify the config file to
> > active it.  In this way, their code re-activates even if they lose access.
> >
> > >
> > > Are you suggesting hackers are exploiting flaws in the config file parsers?
> > > Because in that case we should just fix the parsers. Or perhaps configuring
> > > the system in an unsafe way?
> >
> > No, but that's a good point.  We can begin to address those
> > vulnerabilities with static and dynamic code scans and config file
> > fuzzing, and with good design and documentation about config files.
> >
> > >
> > > Anyway, having any writable storage provides a place to drop payloads
> > > and generally wreak havoc, but having an unconfigurable BMC is not a
> > > direction I think we should go, it seems pretty restrictive. We do need
> > > to be careful about how we treat the content though, as it can't really
> > > be authenticated.
> >
> > Agreed.
> >
> > >
> > > Andrew
> > >
> >
