Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B4248A157
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 22:01:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXmSy0CM1z30FH
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 08:01:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qqQApoZw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qqQApoZw; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXmSW0FP8z2xB0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 08:00:42 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id o12so48990592lfk.1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 13:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Zz5DAePNbf+ygf0mEXpWopJEPxDcyiTmpfR+9vADytc=;
 b=qqQApoZwJsYu8DWigjMoeRpR20tgRWxhrzLJT6xiGIVLIjXwvSb3DAh+f4K3DAR5dD
 W+S9tRxGTpduJ2T4MylsgXFZTh9QeJjFHrZE/oYFJw8W5N9ZHCe7tdvUxygdRN6/EBU9
 XzxfgH6xoC4Hd0GX2mwFwJVQKAlx+BT+qiw9JQhzgnhWXxI6selJ79s6qNpbBY54aTcG
 RTlYtoDbFiVXn8wKgUE46SmEsfux/kuBh92Be3FwtTofTFVNBI8hIlQjIwNwMEPN+ef3
 SZ2R/J4xDF3GiQczNXH1ecJYAmDrCi/NhOzaGDcqXKV4EIFdXR3kLk0xC2wTHxdMS0uD
 6xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zz5DAePNbf+ygf0mEXpWopJEPxDcyiTmpfR+9vADytc=;
 b=SxwF6zyEnBVqvYwvZ+DT3t5aeqriYEkCWZusOGXJXSijYn66usY5efmR5fOsKz2fIi
 AsSXCIR13Ykh5156aUCj/AQXbmTgXNpehcoT0U1ElC9cAbYLvOVkdLLqRkJdNuBgOFJ7
 u7/7TNFVWm/ELVFtW3RV2HcF2K8uuON5eK0kBDDU3CJJShPZq6zTeCItUu7k9L+zsuHv
 tNkXlvgKTp1sXf77SsDYw3fUdbq8Yk2cTmv6IGPf1P2dP8tr7SRaN/Ur2Jaj6hOr0osd
 EyCmyme9ia5f8IUc81ZLMoaIP4r0sNwL36FAod3QrSKBhdH7YwaHas4TjyPeXBdgTTWC
 7gig==
X-Gm-Message-State: AOAM530k5fCbFhdtJHn4bvu1E0DiYU3GKsQ5JtBOCMDlRGZ+Wz5ZPBQP
 WNUNDV+Q/mCplPxfuqnGDEc=
X-Google-Smtp-Source: ABdhPJxJGD+wmqJLL+r+y0dIpUqxL3HmJ/gAzmTfCfZ1FvJQjmOPiZuwr9Tx2FmEY7c/sQOA45rdZQ==
X-Received: by 2002:a2e:bd04:: with SMTP id n4mr842807ljq.451.1641848438218;
 Mon, 10 Jan 2022 13:00:38 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id p6sm1123024lfg.307.2022.01.10.13.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:00:37 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 20AL0YVH005270;
 Tue, 11 Jan 2022 00:00:35 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 20AL0Y6a005269;
 Tue, 11 Jan 2022 00:00:34 +0300
Date: Tue, 11 Jan 2022 00:00:33 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: LDAP groups and roles mapping
Message-ID: <Ydyecaeaf7jYTAk8@home.paul.comp>
References: <Ydw+3uYSqK44CTHq@nbwork.lan> <YdxFQl9Opddem7O5@home.paul.comp>
 <YdxXMBloqYjk8Zy8@nbwork.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdxXMBloqYjk8Zy8@nbwork.lan>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jan 10, 2022 at 06:56:32PM +0300, Alexander A. Filippov wrote:
> On Mon, Jan 10, 2022 at 05:40:02PM +0300, Paul Fertser wrote:
> > On Mon, Jan 10, 2022 at 05:12:46PM +0300, Alexander A. Filippov wrote:
> > > Our customers want LDAP groups and roles mapping working not only by primary
> > > group, but also by the membership in one of these groups.
> > > And this requirement seems to me reasonable.
> > 
> > A sidenote: windows active directory admins might also want you to
> > take nested groups into consideration. I suggest you check with the
> > customers if that's the case or not.
> > 
> 
> Yes, it looks like a problem.
> I'm afraid that the recursive queries will execute too long and PAM will give
> rejection by timeout.

But phosphor-ldap-config already special-cases
ConfigIface::Type::ActiveDirectory so instead of

        confData << "filter passwd (&(objectClass=user)(objectClass=person)"
                    "(!(objectClass=computer)))\n";

it can use something like

filter passwd (&(Objectclass=user)(!(objectClass=computer))(memberOf:1.2.840.113556.1.4.1941:=cn=cumuluslnxadm,ou=groups,ou=support,dc=rtp,dc=example,dc=test))

(phosphor-ldap-config generates /etc/nslcd.conf; this particular
example is from Cumulus Linux, instead of
cn=cumuluslnxadm,ou=groups,ou=support,dc=rtp,dc=example,dc=test full
DN of any group can be specified)

> But `phosphor-user-manager` allows to create mappings of several LDAP groups
> into one role and thus, I suppose, we can claim that we don't support the nested
> groups.

Please consider supporting nested groups at least for AD, this seems
to be easy enough.

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
