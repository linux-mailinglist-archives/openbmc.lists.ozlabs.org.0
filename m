Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC1AA2C239
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 13:09:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqCSY4Wgxz3bxf
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2025 23:09:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.149.242.128
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738930154;
	cv=none; b=ZK6oZodIqpRiquzoC2d+HI4S+6uwC7PyQ96H4Lj7/FmGPgNquK0knoFKzsD08aH0xbxJmqs9MDqd1VhtjvG22JHFkMqIsi3AV0VRxJwbfTTz/63oAJ8GhNldHuTymu93uev5jXM+JomfgoDsnftoDu9ivChUgA1HbZQx2U5YWJEy2PSHpOYycidI0KrCyJgzLruRB8SW8Rbb/kfxN4/yFoEJEDNEewcSYw/UOVxakLJl5VE6F0iVWj2YuZoH2QZyeQHAvDr2uEvPnzs50JG/pAUbCZQgLNqZg5As5Q0WMzekATet4l5b7iNz1H8DKT82Z+250laNhYt65pQsyOShHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738930154; c=relaxed/relaxed;
	bh=4JSFkVMmkJaOiti6dUxF+hh5HJxwUetT4nL48mE20rs=;
	h=References:Content-Type:Message-Id:Cc:Subject:Mime-Version:Date:
	 To:From:In-Reply-To; b=OKqEM2YqRNlk6fVinnU1XZPRKKCgz2RSOxrUGwMIiLVfzza7lYO55mVdsCDzfn/RtSQ8kC0kxd6uxcq6+bhw2K0tNaKbnCzR+NnL6lBKu8U1t9MU3vQ0Dcfwee8EmdUu7RhnjG5RBiBhhRTYhrUokVsAmdJ+x/y4glRbDqfgeioUN2AbojTZYIMu7OY8AkUWQGplL5p7+VYPJoQbU+gEAbX4ZQcD+0+bSsCJKOyOdPzsMarCfdhnnJ5Sy5lYrCSIQIH6V8RM/OpPgM00970U+jGtaaLRNn1+CbFeQuKlGXXWldGsTjn3BC8zJXRxcS4dIS1EPJlWYZQoOHkZsLY64A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Rr/gNwTj; dkim-atps=neutral; spf=pass (client-ip=103.149.242.128; helo=lf-1-128.ptr.blmpb.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Rr/gNwTj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=103.149.242.128; helo=lf-1-128.ptr.blmpb.com; envelope-from=zhangjian.3032@bytedance.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 615 seconds by postgrey-1.37 at boromir; Fri, 07 Feb 2025 23:09:12 AEDT
Received: from lf-1-128.ptr.blmpb.com (lf-1-128.ptr.blmpb.com [103.149.242.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqCSS0qXfz30RG
	for <openbmc@lists.ozlabs.org>; Fri,  7 Feb 2025 23:09:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1738929270; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=4JSFkVMmkJaOiti6dUxF+hh5HJxwUetT4nL48mE20rs=;
 b=Rr/gNwTjjd4Y6sh0q9CTCyIXPghOssPT83Y3wwJXiES0y3Kkg8gMNVialG7rriAOCZNyBF
 Jo3rzpLjAh9MFXDi53rtYIAnSz0NwhX/szl4DZseSW+8wl+UmzL0lu9OkgcbBKv1InrAw5
 6O7BZ7HMFA+ZrQIRiBpRxTQRPrWI3BURaFY3msBPqEVPBez7FsQJ2u+4mgVIzk/7IBf9e+
 1h8W+uFOSQuVqa8HhmRtYAg2JUDZgyvA/ArBCL7/b3D6JG73eXo8R6GwWWpQ5/oJoJDF3R
 S90ymgVl8oB+UiA6+6/lrJbuFCIG/eH6DCQYhFrXq3zNKwAIaPQ3Z7r+yypXiw==
References: <3e85a9834ada4944a629c50cd6389630@asrockrack.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <51dd8bf76aa056fbc966e48132cac2607d2326ca.a3a848b5.1084.42df.ae2f.330bbfd1cd95@bytedance.com>
Subject: Re: [External] dbus-sensors issue
Mime-Version: 1.0
X-Lms-Return-Path: <lba+167a5f475+a5d693+lists.ozlabs.org+zhangjian.3032@bytedance.com>
Date: Fri, 07 Feb 2025 19:54:28 +0800
To: =?utf-8?b?SmVmZjkgQ2hhbijpmbPmnb7lhIlfQVNSb2NrUmFjayk=?= <Jeff9_Chan@asrockrack.com>
From: "Jian Zhang" <zhangjian.3032@bytedance.com>
In-Reply-To: <3e85a9834ada4944a629c50cd6389630@asrockrack.com>
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

See:
https://lore.kernel.org/lkml/20230716195007.731909670@linuxfoundation.org/
https://bugzilla.kernel.org/show_bug.cgi?id=3D217699
For services utilizing io_uring, when waiting for I/O, CPU time is counted =
as I/O rather than idle time.

Jian.
> From: "Jeff9 Chan(=E9=99=B3=E6=9D=BE=E5=84=89_ASRockRack)"<Jeff9_Chan@asr=
ockrack.com>
> Date:=C2=A0 Fri, Feb 7, 2025, 19:42
> Subject:=C2=A0 [External] dbus-sensors issue
> To: "openbmc@lists.ozlabs.org"<openbmc@lists.ozlabs.org>
> Hi all,
> It appears that IO wait is very high all the time. This can be viewed by =
running `top`. It was traced down to dbus-sensors systemd units. When the u=
nits are running, IO
=C2=A0wait is >90%. This can impact system performance and also impacts CPU=
 utilization telemetry, since the idle task never runs, which normally mean=
s CPU is being completely utilized.
> =C2=A0
> My platform uses below services, stop them will free the IO usage, any id=
ea?
> =C2=A0
> xyz.openbmc_project.hwmontempsensor.service
> xyz.openbmc_project.fansensor.service
> xyz.openbmc_project.adcsensor.service
> xyz.openbmc_project.psusensor.service
> =C2=A0
> =C2=A0
> best regards
> =C2=A0
> Jeff Chan
