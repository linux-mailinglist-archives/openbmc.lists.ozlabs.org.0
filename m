Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9231A117E09
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 04:03:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47X4dK5v05zDqWG
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 14:03:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::130;
 helo=mail-il1-x130.google.com; envelope-from=mine260309@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="n8LlcnUg"; 
 dkim-atps=neutral
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47X4cL5XK7zDqRm
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 14:02:42 +1100 (AEDT)
Received: by mail-il1-x130.google.com with SMTP id b15so14765170ila.7
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 19:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wXHV3PMyHYn9Qak2R+pM795uN+Hj2vshJRSoCYRf03U=;
 b=n8LlcnUglvFpL81Bp2+Viuc7/x/dk03xqPYERo/bEr5VX41yW/M2MD9c8Dl98alRYF
 IGnxp0uwcifUC5B8ifGHzeXULZxubSaXp58OohCQXLw18TzAPfPXrXKMYRwsqKtzIG4+
 zchWaxuy/ac6geAzSMEI6ZWIARljUwKMn3Ey20lEceqmdcUWqiMifsbWc2kp8pKxbP/4
 q25Oj/6PYbU0fVEhUz5UMXHSDv4P+CbzcTiMkRNyGZuf5Iy2JB8uCPETMpGECsVj6D8S
 sqiwI4QBwmc88p63WCbwqDaLQ8T7V+uX6JMC5oTL9tykzW+RK4rQ8PRACIRpMIecLq4t
 XHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wXHV3PMyHYn9Qak2R+pM795uN+Hj2vshJRSoCYRf03U=;
 b=XFhLvK9o9S/vhAxukkHoJiubateVNU5Q8yfSWQJ5DXpAF8+EkchPTeAL9mPDqssDwT
 AOvSJ4odYUghc6asI312HCLFmlwEAUZsj3ydEH1CWWHH63jCK+Qa5CyAiq7J/Ea5U8bo
 eVfL6yaalONfxMh6HJB+5HxcDyFS5+taUNxE5dA8urRObaY48DOdhHl7GBVf2p3z7eUn
 d+k0BEQjN3RPycxlHhGNEB2+dXmaxZTawFLYebnJn+qiPT2yfxxgXip+crTZVW/BM2ZG
 NWV2oy+WaijKymTAY8sCjGst9CGD5kv5kbIZyyoa+LWcpLLeNU4LKm079p9bkPSLbgma
 KxLg==
X-Gm-Message-State: APjAAAVCmzu/ITK7Kck1Y1B99UsPKj+HG0iSC5iLFsGfhDIawrnsE0MS
 FghNUoZU4QTptXjOAtVcEFSM2cz2URDXN1O9evjASt0A
X-Google-Smtp-Source: APXvYqwaYdOnTzZTc2Vqa9n3OeW+yi2vlHS2vkgYogSugsSG2nKM3xtlbetF+olOUyKueqwRkrG5CE64vFraCl6zngo=
X-Received: by 2002:a92:7949:: with SMTP id u70mr403291ilc.42.1575946959007;
 Mon, 09 Dec 2019 19:02:39 -0800 (PST)
MIME-Version: 1.0
References: <CAARXrtmNP3upYusBU6quTcfkU_Po3QvcM-SD=D7v0JKJGWzUXA@mail.gmail.com>
 <14F75671-F93C-41EB-A879-4E44C6F24F71@fuzziesquirrel.com>
In-Reply-To: <14F75671-F93C-41EB-A879-4E44C6F24F71@fuzziesquirrel.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 10 Dec 2019 11:02:29 +0800
Message-ID: <CAARXrtm72Z3uqt1QpJFEQXpK851FJqUNkUFrbuCJUoKMbVbFLw@mail.gmail.com>
Subject: Re: To add a new interface for timed power on feature
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Dec 9, 2019 at 8:22 PM Brad Bishop <bradleyb@fuzziesquirrel.com> wr=
ote:
>
>
>
> > On Dec 9, 2019, at 4:49 AM, Lei YU <mine260309@gmail.com> wrote:
> >
> > This email is to introduce a new interface to be added to
> > phosphor-dbus-interfaces, and ask for feedback where it should be
> > placed into.
> >
> > There is a feature Timed-Power-On (TPO), that host could schedule a
> > timer to BMC to power on the host.
> > For BMC there will be a service to handle the above case, and the plan
> > is to add a new interface to represent the timer (actually a date) for
> > TPO.
> >
> > It could look like:
> > /org/open_power/TimedPowerOn/Epoch.interface.yaml
> > Where it defines the epoch time when the host is going to be powered on=
.
> >
> > The question is, is this feature common for other systems?
> > If yes, I would like to put it in `/xyz/openbmc_project`, instead of
> > `/org/open_power`
>
> It is just an interface, and one that doesn=E2=80=99t have anything to do=
 with POWER hardware, so I don=E2=80=99t see a problem with putting it in t=
he xyz namespace.  Do you already have an implementation plan?

OK, so let's put it in `/xyz/openbmc_project`.
The feature is just estimated and planned, we will start to work on it soon=
.
