Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE78E60B9BE
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 22:20:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mx5z64YGgz3bjP
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 07:20:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CV1j0hql;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=edtanous@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CV1j0hql;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx5yY2K3mz2xJF
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 07:19:32 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id g12so5073421wrs.10
        for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 13:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+jeo98ttc1QCF74lvsg705JB5Mfac4DV62AJfZ019M=;
        b=CV1j0hqlvZeJ7Lxr3F+fvOY/ixuTafUxinad4l62/rLqM1hsb+zifXVUfnpPAfa3zo
         dAt+ggyNXHQUt7EXVzm7r9nuXtLFF4Obvu1FqopcZKMMrwFa/oc2//jP/C1XDm/iJ0or
         QApqGeM0Mc9+6qbjpIHptjIohCJccaRrhy4Z+xQkDFzxhCAjirdo9yuqrIPJWpw0FLVI
         IK2+ylqQv8rYqvmgnvh7h1UgdKT0NqteNrGdanX0pSOd7batEq5KWdXYdzKqpFt8BAPa
         FYiM9uHJqsSWB/d+cHYybcwTJkzk4vlVf7/1wA0TmZ+iE7IBXynTQlEMaIwGrh4bseM4
         lKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+jeo98ttc1QCF74lvsg705JB5Mfac4DV62AJfZ019M=;
        b=YdLJ4l7jBgESQ6FhVd+zWZEWdyhfc+UNWo90sEUaj3pdnviL/EACn07Og87rXgvGbJ
         50M7WBa92ZgwrSZEgCp69uW94kCZJHUPk5F/rTncia0iJ+EMHdBWFAqFV46/jZX9ZLxJ
         +ysEOe4Oy2XG62UGwoUzxMFsh+OwiHo6SM/p4lZ9WHir4NOqO225G17e4hlA2cTduQG2
         RHM/xc1e329C/fki2uF3BOVyc/ikjEoFlF7cASz9NuNj+aypsPcFizMe/rDWzGwl88nI
         YcBnOA/u/S6jfNNpZhqxexe5eo1z2nZSDOhWY3/kvosLAIWD74OiiUW1UYQdXZFNfGac
         r79Q==
X-Gm-Message-State: ACrzQf2PVCvUy5I4qv5MQl8qF0Do2fn+E+g7dA8+e3zLI1MHMXRcRa7t
	l/mOWn9KSOUi9VnhARSTmiPafstVp/reGAZlpJweWnDRvRYlQw==
X-Google-Smtp-Source: AMsMyM6/zv9EYEfNUZekvWo2txBxwQ44oPcYd8xoTn29xMSvFPAfzdDqdd1fyEgjHtrxTJpI17JoFFsWbI9Z3YZu8C4=
X-Received: by 2002:a05:6000:81d:b0:236:73ae:799e with SMTP id
 bt29-20020a056000081d00b0023673ae799emr3737868wrb.559.1666642768293; Mon, 24
 Oct 2022 13:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
 <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
 <CAGm54UE55N3JW0CUYb9piRopBcz35+Q2H66row-fDBf1VEGo+w@mail.gmail.com>
 <b96c24c0a1e5779c66a8882b6eec9883f9bd5e00.camel@fuzziesquirrel.com>
 <5994636c-b32a-0b8a-5873-a73390318fe3@linux.intel.com> <20221019171044.s4kfuqehuwwxpiit@cheese>
 <6a0d18b1-cc43-41ad-9f9a-85c0a927e5b2@linux.intel.com> <CAH2-KxDoO4=141nhu2OV-FmyqCCst8_2TSmgvhJP4Ch14vas0A@mail.gmail.com>
 <20221024190322.et5kn54vong3tn2v@cheese>
In-Reply-To: <20221024190322.et5kn54vong3tn2v@cheese>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 24 Oct 2022 13:19:15 -0700
Message-ID: <CAH2-KxCAGR0LKE5iDecqe1hSf2zJ2xYhVbYS2hfedrpf9S70Ag@mail.gmail.com>
Subject: Re: Adding support for custom SEL records
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 24, 2022 at 12:03 PM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
> This is helpful, thanks Ed.
>
> On Mon, Oct 24, 2022 at 10:59:51AM -0700, Ed Tanous wrote:
> >From what I recall, the requirements were:
> >- Ability to store 4000 logs in a rotating buffer (original desire was
> >10,000, but 4000 was picked as a middle-ground that could be
> >implemented).
>
> A DBus object based implementation could meet this requirement, right?
>
> >- Ability to log 100+ entries per second, including when buffers get
> >overwritten.
>
> I guess I would not be shocked if DBus objects + serialization might not
> be able to sustain this rate of incoming logs.  Maybe it depends on the
> filesystem or how the data is serialized in the filesystem.  The DBus
> approach creates many files.  Obviously the syslog approach is only
> using a couple of files.
>
> Do you think this kind of requirement is typical?  Quoting Patrick from
> another thread here:

There are cases where every sensor will cross a threshold at the same
moment (generally because a threshold was changed).  Is this a
"typical" use case, probably not, but if it's trivial to DOS the BMC
with events with a couple commands, it's not great.

>
> >don't think anyone is intending to create 10k events in the span of
> >a minute

Intending to, no.  Created in an error case, or in the case of a
failing piece of hardware, it can happen.

>
> 100/s is only 6k in a minute but that is getting pretty close...
>
> >- (abstract) Log storage should be aware of hardware limitations (SPI
> >flash cell write endurance) and allow writing N logs per minute for
> >the lifetime of the machine without hardware failure.  (I forget the
> >value of N).
>
> Do you think the rsyslog implementation does better at this?  Why?

@Jason?  I know there were a lot of worries about write expansion (N
byte sel log turning into 100XN bytes of JSON) wearing out flash
faster, and having some interactions with jffs2.

>
> >- "ipmitool sensor list" should return the results from a full sel log
> >in less than 1 second (renegotiated from 200ms, the faster the
> >better).
>
> Ok, again I would not be shocked if DBus objects weren't able to deliver
> on this.
>
> >- The logging implementation should be able to support a well-formed,
> >version controlled, Redfish MessageRegistry to the DMTF
> >specifications.
>
> Do you think a DBus object based implementation could meet this
> requirement?

Today, as defined, without duplicating the logging strings, no, but
DBus is just an IPC;  I'm fairly certain we could define a DBus based
logging mechanism that met these requirements, but the key is that the
Redfish instance (bmcweb in this case) needs a-priori knowledge of
every possible log that the system can publish, and version them with
DMTF-appropriate semver (existing messages changes rev the patch
version, new messages revs the subminor version).  The existing
rsyslog implementation places the log strings into bmcweb, so the only
thing being transferred over the IPC is the MessageId and the
specific-instance arguments, which in theory, increases the
performance quite a bit, and avoids duplicating the strings in two
places.

>
> >- The logging implementation should be able to implement a
> >well-formed, stable, and ACID compliant IPMI SEL command
> >implementation.
>
> Do you think a DBus object based implementation could meet this
> requirement?

Same answer, with today's code, no.  DBus is just an IPC, we could
potentially define one.

>
> >
> >I don't believe the current DBus implementation can meet the previous
> >requirements,
>
> The motivation of my questions above is to understand which requirements
> cannot be met by something based on DBus objects.

Cool.


>
> Thanks,
> brad
