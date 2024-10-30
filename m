Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7B49B5C24
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2024 08:00:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XddLJ5Xk6z3bw9
	for <lists+openbmc@lfdr.de>; Wed, 30 Oct 2024 18:00:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730271620;
	cv=none; b=h6iNaU+bOBM7BS5sFj4Pu3czSgyhLzXCcTZalQkJ9hvq80W7zpfdiYRDl5VSJGSY85FkO9+4sOSJ0TRgHnGR4HkI6QQm8NCYaYL7hLTJmpyq/vdvLTBjkoxcH1ZUCbc3mwpumi0Ec7XzGCiO3Egb7MshE8+O53S+kXqQx96rWD++Wcw/Y7Be9s7EtZQpm7OIv1rxQqnham6Ce+/Jax3tVvGHWX+QG/b/DAOUOUyKOL/XQF37w8UJiOjhWAKAERWuCKpjlFI1enOgTEX/dTi6L9Whkuws5affqEi2datfK+o+6D0luacIdeNJKGV9Z7F44QU1vzob+qr62S1uJq2E5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730271620; c=relaxed/relaxed;
	bh=xiwX5W2TdVmTtM1efzfeC2MmceLTmEYWdS2ZrHT8lxQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eEvaiub+QknCP2uB9O9ifguQNR4NQN/zlKL6bOOh0sdUnR3THPsP1g3XFENz6+uXYdFWGZ223WLqDjYvGsJTocArIQjl+YkpaH8rQiEFlIhBUvVQiY8m2aoEEajVbJBfGNj8pgObsSrBBrH0DGMdln9vWQUd3ZHJ+UbzDyd1VdRaUh3bEwSBLfMYABiOo7j+mY1C4QwXiZjm4hI+ULka4GY0wjH7i+torMgFfcOILRYfWbVh+iAhndrNv25u74XFcdzdLN0paSydx3hYJ/OEPDi/TQBBHd0O9JTex2aQDx/YkpT/bWIZCi5IGTyCfA7TCCGc1nPEIE/pIHFo8neeRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QlJHIpsl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QlJHIpsl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XddLB4dRgz2xMQ
	for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2024 18:00:16 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7ea16c7759cso3197383a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 30 Oct 2024 00:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1730271614; x=1730876414; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xiwX5W2TdVmTtM1efzfeC2MmceLTmEYWdS2ZrHT8lxQ=;
        b=QlJHIpslZiXpAD/VHNsvSVYJLJDQd9z1/qY4WOe4oDbbLvNocGr7i/Jtu2FcjO6ZAj
         d6ACuEt4EIoyoS4TIbgfbk+Tt2RvL/g7yJ1CKMhQhvmxzdKQZbic5RRiEZndLVOp9OSm
         kwcfAEbugdamB8D3F05yibr7OOJw1TB08lnDb1MPoMIUIUtvwvqcZCCp/ALmvkj/SJ7D
         +d4cdDlIz40t1w88+Fty3GmndeqJBaHtzcTLKvYxTcp+zjrlirZZJYPsELAubSBhKnvS
         iHTwr9nDGprWEo9LlFkSHmGru8pSDFWEnhOGQSAoVknrwJf4zkX5LzpWEJatLMDbPkYG
         S5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271614; x=1730876414;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xiwX5W2TdVmTtM1efzfeC2MmceLTmEYWdS2ZrHT8lxQ=;
        b=S5NZv/hc8cCc3QsVjw3t+Y65EMxdRu99c2/aDr5guaAbNSymsigr64AL7Rpe1tkgk5
         93GYWyAUk7fMgYZnb19BS7HdczirbOF1jkB9a1YpZaJhZVx0NYiLp/OZwIP67DyiJUum
         V/RdEnZkg3yfxFSpCCNEuFTOLJt9n3smwPKvUIl7ZeStMeiszjaiLPsr2W6Zvh+JxUIh
         qSVwwE/vAC2Y66pkarPDfK86rGf7Ct2MpO8Km+97fo5On0w9LmWLJrnquTXMT7hTtXQ7
         iwIrv+WLrwTzCAy6RBUxoEx8XLrc6IzUEV2XOjm7MfPvLu+MxZPuXnNgX+k7ko1DO/9n
         w5yw==
X-Gm-Message-State: AOJu0Yy9BbJby4/MWuClDB21RY5VG1Ft0VuPbjw1Y9VMryOwZX2CdvIa
	YGbpLT8QOoJJiWScvtIqhltfEmYSqHaLydSBushH32fBk6kzKyDgG3/5R5R9E3rW4qMl3qa3faX
	SavYXigfDc/18665B1dyQZ/HoKxB6WPdk1yL7v/zpvudoZGl6NWYbv5I2
X-Google-Smtp-Source: AGHT+IEygNFaupSf1IZaVyhtugWjVfJvgdeFANHXDI50MvY2LuvVTMEQjyM4aOunUmJJTRTYs6EKxqjjhaJWWkMlbkM=
X-Received: by 2002:a05:6a20:b58b:b0:1d7:118a:327b with SMTP id
 adf61e73a8af0-1d9a83af6cfmr19033636637.9.1730271612223; Wed, 30 Oct 2024
 00:00:12 -0700 (PDT)
MIME-Version: 1.0
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 30 Oct 2024 15:00:01 +0800
Message-ID: <CAGm54UE4SXfY30oUrr9vVa+=j_Ra971A7ZcBMyMN2TgTaXN8+w@mail.gmail.com>
Subject: mapper: should it add "default interfaces" and is it valid to
 implement no interfaces on an object?
To: openbmc <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This email is to discuss and ask the following questions:
1. Should mapper add "default interfaces" for all the objects and their parents?
2. Is it valid for a D-Bus service to implement no interfaces on an object?

TL;DR

# Background
* We noticed error logs "Bad dbus request error: Invalid request
descriptor [generic:53]" in bmcweb
* In https://gerrit.openbmc.org/c/openbmc/bmcweb/+/74593, it tries to
fix the above issue by filtering the "default" interfaces
* In the gerrit review, it's asked if the "default interfaces" are
really needed?
* Then https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/74832 is
submitted trying to remove the "default interfaces" in mapper, and
results in some regression in bmcweb.
And it leads to this discussion email.

# Details
## mapper
In mapper's introspect, it adds the "default interfaces" to all the
parent objects that implements the "Association" interface, For
example:
   * xyz.openbmc_project.Software.BMC.Updater implements
`/xyz/openbmc_project/software/c172a378` object with Association
interface;
   * After introspect, mapper will add 3 default interfaces to the
object and its parent objects
```
# busctl -j call xyz.openbmc_project.ObjectMapper
/xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
GetObject sas /xyz/openbmc_project/software/c172a378 0
{
        "type" : "a{sas}",
        "data" : [
                {
                        "xyz.openbmc_project.ObjectMapper" : [
                                "org.freedesktop.DBus.Introspectable",
                                "org.freedesktop.DBus.Peer",
                                "org.freedesktop.DBus.Properties"
                        ],
                        "xyz.openbmc_project.Software.BMC.Updater" : [
                                "org.freedesktop.DBus.Introspectable",
                                "org.freedesktop.DBus.Peer",
                                "org.freedesktop.DBus.Properties",
                                "xyz.openbmc_project.Association.Definitions",
                                ...
                        ]
                }
        ]
}
```

If we introduce the change in
https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/74832, the
above command will get this result:
```
# busctl -j call xyz.openbmc_project.ObjectMapper
/xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
GetObject sas /xyz/openbmc_project/software/c172a378 0
{
        "type" : "a{sas}",
        "data" : [
                {
                        "xyz.openbmc_project.ObjectMapper" : [],
                        "xyz.openbmc_project.Software.BMC.Updater" : [
                                "org.freedesktop.DBus.Introspectable",
                                "org.freedesktop.DBus.Peer",
                                "org.freedesktop.DBus.Properties",
                                "xyz.openbmc_project.Association.Definitions",
                                ...
                        ]
                }
        ]
}
```

Note that it indicates that `xyz.openbmc_project.ObjectMapper` service
implements **NO** interface on the object.

## D-Bus calls on "default" interfaces
Additional tests shows some inconsistent behavior on calling the
"default" interfaces' methods.
1. It shall be OK to call `GetAll` method on all the interfaces, for example:
```
busctl call xyz.openbmc_project.Software.BMC.Updater
/xyz/openbmc_project/software/c172a378 org.freedesktop.DBus.Properties
GetAll s org.freedesktop.DBus.Properties
a{sv} 0
```
2. It fails to call `GetAll` method to the `mapper` service on the
same object, which "indicates" that the interface
`org.freedesktop.DBus.Properties` is not really implemented on the
object.
```
busctl call xyz.openbmc_project.ObjectMapper
/xyz/openbmc_project/software/c172a378 org.freedesktop.DBus.Properties
GetAll s org.freedesktop.DBus.Properties
Call failed: Unknown object '/xyz/openbmc_project/software/c172a378'.
```
3. However, `GetMachineId ` method works OK on both services, which
"indicates" that the interface `org.freedesktop.DBus.Peer` is
implemented by both services on the object.
```
# busctl call xyz.openbmc_project.Software.BMC.Updater
/xyz/openbmc_project/software/c172a378 org.freedesktop.DBus.Peer
GetMachineId
s "a9af6f883ddf45289683c9583541a5ba"
# busctl call xyz.openbmc_project.ObjectMapper
/xyz/openbmc_project/software/c172a378 org.freedesktop.DBus.Peer
GetMachineId
s "a9af6f883ddf45289683c9583541a5ba"
```

## Some conclusion
From the above behavior, we could make some conclusions:
* It seems wrong for `mapper` to add the default interface
`org.freedesktop.DBus.Properties` for all the objects, because it can
not be called as above example 2.
* It is also wrong for `mapper` to not add default interfaces at all,
because at least `org.freedesktop.DBus.Peer` works OK as above example
3.

## Workaround
1. The bmcweb patch
https://gerrit.openbmc.org/c/openbmc/bmcweb/+/74593 is the workaround
to skip calling the "default interfaces".
2. The proposed comment in the above review is
https://gerrit.openbmc.org/c/openbmc/phosphor-objmgr/+/74832, which
will break the existing code.

So I would prefer workaround 1.

# Discussions
So here are the questions:
1. How to explain the above behavior of "D-Bus calls on default
interfaces", especially for 2 & 3?
2. Should mapper add "default interfaces" for all the objects and
their parents? If yes, it adds extra interfaces that are not
implemented; If no, it misses some interfaces that an object really
implements.
3. Is it valid for a D-Bus service to implement no interfaces on an object?

-- 
BRs,
Lei YU
