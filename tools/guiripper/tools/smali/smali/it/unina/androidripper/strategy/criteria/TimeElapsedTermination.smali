.class public Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;
.super Ljava/lang/Object;
.source "TimeElapsedTermination.java"

# interfaces
.implements Lit/unina/androidripper/strategy/criteria/TerminationCriteria;
.implements Lit/unina/androidripper/model/SaveStateListener;


# static fields
.field private static final ACTOR_NAME:Ljava/lang/String; = "TimeElapsedTermination"

.field private static final PARAM_NAME:Ljava/lang/String; = "start"


# instance fields
.field private max:J

.field private start:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 19
    const-wide/16 v0, 0xe10

    invoke-direct {p0, v0, v1}, Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;-><init>(J)V

    .line 20
    return-void
.end method

.method public constructor <init>(J)V
    .locals 2
    .parameter "maxTime"

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-wide p1, p0, Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;->max:J

    .line 24
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;->start:J

    .line 25
    invoke-static {p0}, Lit/unina/androidripper/storage/PersistenceFactory;->registerForSavingState(Lit/unina/androidripper/model/SaveStateListener;)V

    .line 26
    return-void
.end method


# virtual methods
.method public getListenerName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    const-string v0, "TimeElapsedTermination"

    return-object v0
.end method

.method public onLoadingState(Lit/unina/androidripper/model/SessionParams;)V
    .locals 2
    .parameter "sessionParams"

    .prologue
    .line 41
    const-string v0, "start"

    invoke-virtual {p1, v0}, Lit/unina/androidripper/model/SessionParams;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;->start:J

    .line 42
    return-void
.end method

.method public onSavingState()Lit/unina/androidripper/model/SessionParams;
    .locals 4

    .prologue
    .line 37
    new-instance v0, Lit/unina/androidripper/model/SessionParams;

    const-string v1, "start"

    iget-wide v2, p0, Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;->start:J

    invoke-direct {v0, v1, v2, v3}, Lit/unina/androidripper/model/SessionParams;-><init>(Ljava/lang/String;J)V

    return-object v0
.end method

.method public setStrategy(Lit/unina/androidripper/model/Strategy;)V
    .locals 0
    .parameter "theStrategy"

    .prologue
    .line 34
    return-void
.end method

.method public termination()Z
    .locals 6

    .prologue
    .line 29
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;->start:J

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long v0, v2, v4

    .line 30
    .local v0, current:J
    const-string v2, "androidripper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Check for termination. Time elapsed: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "s; time limit: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;->max:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "s"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    iget-wide v2, p0, Lit/unina/androidripper/strategy/criteria/TimeElapsedTermination;->max:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method
